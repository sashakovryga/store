class OrdersController < ApplicationController


  # GET /orders
  # GET /orders.xml
  def index
    @cart=current_cart
    @orders = Order.all

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @cart=current_cart
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new

    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to store_url, :notice => "Your cart is empty"
      return
    end

    @order = Order.new 
    @order.user_id = current_user.id
    @order.login = current_user.email
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @cart=current_cart
    @order = Order.find(params[:id])
    respond_to do |format|
      format.html 
         end
  end

  # POST /orders
  # POST /orders.xml
  def create
    @cart=current_cart
    
    @order = Order.new(params[:order]) 
    @order.add_line_items_from_cart(current_cart)
    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to(store_url, :notice => 
          'Thank you for your order.') }
        format.xml  { render :xml => @order, :status => :created,
          :location => @order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors,
          :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    @order = Order.find(params[:id])
@cart=current_cart
    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to(@order, :notice => 'Order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
@cart=current_cart
    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end
end
