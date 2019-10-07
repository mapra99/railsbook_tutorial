require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "name should be up to 50 characters long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should be up to 255 characters long" do
    @user.email = "a" * 256
    assert_not @user.valid?
  end

  test "emails that should be valid" do
    valid_addresses = %w[user@example.com
                        USER@foo.COM
                        A_US-ER@foo.bar.org
                        first.last@foo.jp
                        alice+bob@baz.cn]
    
    valid_addresses.each do |address|
      @user.email = address
      assert @user.valid?, "#{address.inspect} should be valid"
    end
  end

  test "emails that shouldn't be valid" do
    invalid_addresses = %w[user@example,com
                            user_at_foo.org 
                            user.name@example.
                            foo@bar_baz.com 
                            foo@bar+baz.com]

    invalid_addresses.each do |address|
      @user.email = address
      assert_not @user.valid?, "#{address.inspect} shouldn't be valid"
    end                   
  end
end
