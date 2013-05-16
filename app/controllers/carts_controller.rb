class CartsController < InheritedResources::Base
def show
	begin
	@cart = Cart.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		logger.error "неизвестные параметры корзины #{params[:id]}"
		redirect_to store_url, :notice => 'Invalid cart'
	else
		respond_to do |format|
		format.html # show.html.erb
		format.xml { render :xml => @cart }
		end
	end
end

def destroy
	@cart = current_cart
	@cart.destroy
	session[:cart_id] = nil
	respond_to do |format|
		format.html { redirect_to(store_url,
		:notice => 'Your cart is currently empty' ) }
		format.xml { head :ok }
	end
end

end
