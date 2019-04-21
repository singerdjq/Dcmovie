require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end
    
  test "should be valid" do
    assert @order.valid?
  end
    
 test "name should be present" do
    @order.name = ""
    assert_not @order.valid?
  end
    
 test "name should not be too long" do
    @order.name = "a" * 51
    assert_not @order.valid?
  end
    
    test "email should be present" do
    @order.email = "     "
    assert_not @order.valid?
  end
    
    test "email should not be too long" do
    @order.email = "a" * 244 + "@example.com"
    assert_not @order.valid?
  end
    
   

 test "email addresses should be unique" do
    duplicate_order = @order.dup
    @order.save
    assert_not duplicate_order.valid?
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: {  pay_type: @order. pay_type, address: @order.address, email: @order.email, name: @order.name } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: {  pay_type: @order. pay_type, address: @order.address, email: @order.email, name: @order.name } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
