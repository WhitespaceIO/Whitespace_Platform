require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  setup do
    @user = members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member" do
    assert_difference('Member.count') do
      post :create, user: {  }
    end

    assert_redirected_to member_path(assigns(:user))
  end

  test "should show member" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update member" do
    put :update, id: @user, user: {  }
    assert_redirected_to member_path(assigns(:user))
  end

  test "should destroy member" do
    assert_difference('Member.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to members_path
  end
end
