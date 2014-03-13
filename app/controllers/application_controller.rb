class ApplicationController < ActionController::Base

  protect_from_forgery
  private
  def about
  	respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @product }
    end
  end
def current_cart
Cart.find(session[:cart_id])
rescue ActiveRecord::RecordNotFound
cart = Cart.create
session[:cart_id] = cart.id
cart
end
rescue_from CanCan::AccessDenied do |exception|
	respond_to do |format|
		format.html { redirect_to(store_url,
		:notice => 'Вы не можете просматривать эту страницу!!!' ) }
	end
end

end

