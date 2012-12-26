require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
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

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { description: @user.description, favourites_count: @user.favourites_count, followers_count: @user.followers_count, friends_count: @user.friends_count, id: @user.id, image: @user.image, lang: @user.lang, listed_count: @user.listed_count, location: @user.location, name: @user.name, screen_name: @user.screen_name, statuses_count: @user.statuses_count, time_zone: @user.time_zone, url: @user.url }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { description: @user.description, favourites_count: @user.favourites_count, followers_count: @user.followers_count, friends_count: @user.friends_count, id: @user.id, image: @user.image, lang: @user.lang, listed_count: @user.listed_count, location: @user.location, name: @user.name, screen_name: @user.screen_name, statuses_count: @user.statuses_count, time_zone: @user.time_zone, url: @user.url }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
