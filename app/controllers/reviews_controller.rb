class ReviewsController < ApplicationController

  # GET /reviews/new
  def new
    @review = Review.new
    @selectedFood = Food.where(id: params[:food_id]).first
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @selectedFood = Food.where(id: params[:food_id]).first
    @review.food = @selectedFood

    respond_to do |format|
      if @review.save
        format.html { redirect_to @selectedFood, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rate, :comment)
    end

end