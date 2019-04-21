require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end
 test "should be valid" do
    assert @user.valid?
  end
    
 test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end
    
 test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

 test "password should be present (nonblank)" do
    @user.password = " " * 6
    assert_not @user.valid?
  end

 test "password should have a minimum length" do
    @user.password ="a" * 5
    assert_not @user.valid?
  end
    
     

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { name: @user.name, password: 'secret', password_confirmation: 'secret', email: @user.email } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { name: @user.name, password: 'secret', password_confirmation: 'secret', email: @user.email } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
