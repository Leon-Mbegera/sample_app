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
end
