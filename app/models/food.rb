class Food < ActiveRecord::Base
	def self.Category
		["breakfast", "dinner", "lunch", "drinks"]
	end

end
