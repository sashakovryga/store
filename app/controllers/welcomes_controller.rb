class WelcomesController < InheritedResources::Base
	def index
		@cart=current_cart
	end
end
