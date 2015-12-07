class Order < ActiveRecord::Base
  belongs_to :food

  validates :name, :phone, :address, presence: true
  validates :name, length: {in: 2..20}
  validates :phone, numericality: true
  validates :address, length: {maximum: 30}

end
