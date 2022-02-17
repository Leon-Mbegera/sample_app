require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Example User", email: "example@user");
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should not be valid" do
    @user.name = "  "
    assert_not @user.valid?
  end
end
