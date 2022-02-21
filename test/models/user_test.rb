require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Example User", email: "example@user.com", password: "123456", password_confirmation: "123456");
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should not be blank" do
    @user.name = "  "
    assert_not @user.valid?
  end

  test "email should not be blank" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "name should not exceed 50 chars" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not exceed 255 chars" do 
    @user.email = "a" * 256
    assert_not @user.valid?
  end

  test "email validation should accept valid email addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
    first.last@foo.jp alice+bob@baz.cn] 

    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end  
  end 

  test "email validation should reject invalid email addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
    foo@bar_baz.com foo@bar+baz.com foo@bar..com]

    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be valid"
    end 
  end

  test "email address should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email address should be converted to lowercase before save" do
    mixed_case_address = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_address
    @user.save
    assert_equal mixed_case_address.downcase, @user.reload.email
  end

  test "password should be non-blank" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have minimum of 6 chars" do
    @user.password = @user.password_confirmation = "p" * 5
    assert_not @user.valid?
  end
end
