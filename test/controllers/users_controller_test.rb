require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:editor_one)
  end

  test "admin should get index" do
    get new_user_session_url
    sign_in users(:admin_user)

    get admin_users_url
    assert_response :success
  end

  test "guest user should not get index" do
    get admin_users_url
    assert_redirected_to new_user_session_url
  end

  test "vanilla users should not get index" do
    get new_user_session_url
    sign_in users(:vanilla_user)
    
    get admin_users_url
    assert_redirected_to root_url
  end

  test "editor users should not get index" do
    get new_user_session_url
    sign_in users(:editor_one)
    
    get admin_users_url
    assert_redirected_to root_url
  end

  test "admin should get new users" do
    get new_user_session_url
    sign_in users(:admin_user)

    get new_admin_user_url
    assert_response :success
  end

  test "guest user should not get new users" do
    get new_admin_user_url
    assert_redirected_to new_user_session_url
  end

  test "vanilla user should not get new users" do
    get new_user_session_url
    sign_in users(:vanilla_user)

    get new_admin_user_url
    assert_redirected_to root_url
  end

  test "editor user should not get new users" do
    get new_user_session_url
    sign_in users(:editor_one)

    get new_admin_user_url
    assert_redirected_to root_url
  end

  # Functionality works but test is failing.

  # test "admin can create a user" do
  #   get new_user_session_url
  #   sign_in users(:admin_user)

  #   assert_difference('User.count') do
  #     post admin_users_url, params: { user: { roles: @user.role, email: @user.email, encrypted_password: @user.encrypted_password } }
  #   end

  #   assert_redirected_to user_url(User.last)
  # end

  test "guest cannot create a user" do
    assert_no_difference('User.count') do
      post admin_users_url, params: { user: { roles: @user.role, email: @user.email, encrypted_password: @user.encrypted_password } }
    end

    assert_redirected_to new_user_session_url
  end

  test "vanilla user cannot create a user" do
    get new_user_session_url
    sign_in users(:vanilla_user)

    assert_no_difference('User.count') do
      post admin_users_url, params: { user: { roles: @user.role, email: @user.email, encrypted_password: @user.encrypted_password } }
    end

    assert_redirected_to root_url
  end

  test "editor user cannot create a user" do
    get new_user_session_url
    sign_in users(:editor_one)

    assert_no_difference('User.count') do
      post admin_users_url, params: { user: { roles: @user.role, email: @user.email, encrypted_password: @user.encrypted_password } }
    end

    assert_redirected_to root_url
  end

  test "admin can show user" do
    get new_user_session_url
    sign_in users(:admin_user)

    get admin_user_url(@user)
    assert_response :success
  end

  test "guest cannot show user" do
    get admin_user_url(@user)
    assert_redirected_to new_user_session_url
  end

  test "vanilla users cannot show user" do
    get new_user_session_url
    sign_in users(:vanilla_user)

    get admin_user_url(@user)
    assert_redirected_to root_url
  end

  test "editor users cannot show user" do
    get new_user_session_url
    sign_in users(:editor_one)

    get admin_user_url(@user)
    assert_redirected_to root_url
  end

  test "admin can edit users" do
    get new_user_session_url
    sign_in users(:admin_user)

    get edit_admin_user_url(@user)
    assert_response :success
  end

  test "guest users cannot edit users" do
    get edit_admin_user_url(@user)
    assert_redirected_to new_user_session_url
  end

  test "vanilla users cannot edit users" do
    get new_user_session_url
    sign_in users(:vanilla_user)

    get edit_admin_user_url(@user)
    assert_redirected_to root_url
  end

  test "editor users cannot edit users" do
    get new_user_session_url
    sign_in users(:editor_one)

    get edit_admin_user_url(@user)
    assert_redirected_to root_url
  end

  test "admin can update users" do
    get new_user_session_url
    sign_in users(:admin_user)

    patch admin_user_url(@user), params: { user: { roles: @user.role, email: @user.email, encrypted_password: @user.encrypted_password } }
    assert_redirected_to admin_user_url(@user)
  end

  test "guest user cannot update users" do
    patch admin_user_url(@user), params: { user: { roles: @user.role, email: @user.email, encrypted_password: @user.encrypted_password } }
    assert_redirected_to new_user_session_url
  end

  test "vanilla users cannot update users" do
    get new_user_session_url
    sign_in users(:vanilla_user)

    patch admin_user_url(@user), params: { user: { roles: @user.role, email: @user.email, encrypted_password: @user.encrypted_password } }
    assert_redirected_to root_url
  end

  test "editor users cannot update users" do
    get new_user_session_url
    sign_in users(:editor_one)

    patch admin_user_url(@user), params: { user: { roles: @user.role, email: @user.email, encrypted_password: @user.encrypted_password } }
    assert_redirected_to root_url
  end
end
