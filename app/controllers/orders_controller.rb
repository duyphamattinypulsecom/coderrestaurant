class OrdersController < ApplicationController
  def new
  	@selectedFood = Food.find(params[:food_id])
  	@order = Order.new
  	@order.food = @selectedFood

    @firstOrder = Order.new
    @readonly = false
    if session[:order]
      @firstOrder = session[:order].first
      @readonly = true
    end
  end

  def show
  	@orderDetail = []
  	@totalCost = 0
  	session[:order].each do |o|
  		tmp = Food.find(o['food_id'])
  		@orderDetail << tmp
  		@totalCost = @totalCost + tmp.price
  	end
  end

  def create
  	session[:order] ||= []
  	@selectedFood = Food.find(params[:food_id])
  	@order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @selectedFood, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
        @order.food = @selectedFood
        session[:order] << @order
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :address, :phone)
    end
end
