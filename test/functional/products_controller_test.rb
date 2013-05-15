require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, :product => { :camera => @product.camera, :chastota => @product.chastota, :core => @product.core, :description => @product.description, :diagonal => @product.diagonal, :god => @product.god, :image_url => @product.image_url, :op => @product.op, :os => @product.os, :price => @product.price, :resolution => @product.resolution, :time => @product.time, :title => @product.title, :volume => @product.volume }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, :id => @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @product
    assert_response :success
  end

  test "should update product" do
    put :update, :id => @product, :product => { :camera => @product.camera, :chastota => @product.chastota, :core => @product.core, :description => @product.description, :diagonal => @product.diagonal, :god => @product.god, :image_url => @product.image_url, :op => @product.op, :os => @product.os, :price => @product.price, :resolution => @product.resolution, :time => @product.time, :title => @product.title, :volume => @product.volume }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, :id => @product
    end

    assert_redirected_to products_path
  end
end
