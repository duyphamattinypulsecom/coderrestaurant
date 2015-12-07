class Food < ActiveRecord::Base
	has_many :reviews, dependent: :destroy

	def self.Category
		["breakfast", "dinner", "lunch", "drinks"]
	end

end
