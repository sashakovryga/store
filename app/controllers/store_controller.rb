class StoreController < ApplicationController
def about
end

  def index
  	@search = Sunspot.search(Product) do
    fulltext params[:search]
  end
  @products = @search.results
@cart = current_cart
respond_to do |format|
      format.html
      format.xml  { render :xml => @products }
    end
  end

end
