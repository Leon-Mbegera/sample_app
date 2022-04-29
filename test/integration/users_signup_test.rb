require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest

  test 'Test for an invalid user sign up' do
    get signup_path
  
    assert_no_difference 'User.count' do
      post users_path, params: { user: {
        name:  "",
        email: "user@invalid",
        password:              "foo",
        password_confirmation: "bar"
      }}
    end
    assert_template 'users/new'
  end

  test 'Test for a valid/successful user sign up' do
    get signup_path
  
    assert_difference 'User.count', 1 do
      post users_path, params: { user: {
        name:  "leon mbegera",
        email: "user@valid.com",
        password:              "123456",
        password_confirmation: "123456"
      }}
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end

  
end
