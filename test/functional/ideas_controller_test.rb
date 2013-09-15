require 'test_helper'

class IdeasControllerTest < ActionController::TestCase
  setup do
    @idea = proposals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ideas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proposal" do
    assert_difference('Proposal.count') do
      post :create, idea: { text: @idea.text }
    end

    assert_redirected_to idea_path(assigns(:idea))
  end

  test "should show proposal" do
    get :show, id: @idea
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @idea
    assert_response :success
  end

  test "should update proposal" do
    put :update, id: @idea, idea: { text: @idea.text }
    assert_redirected_to idea_path(assigns(:idea))
  end

  test "should destroy proposal" do
    assert_difference('Proposal.count', -1) do
      delete :destroy, id: @idea
    end

    assert_redirected_to ideas_path
  end
end
