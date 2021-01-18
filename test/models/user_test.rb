require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:editor_one)
  end

  test "User is valid with the attributes present" do
    assert @user.valid?
  end

  test "User is invalid without email" do
    @user.email = nil

    refute @user.valid?, 'user is valid without an email'
    assert_not_nil @user.errors[:email], 'no validation error for email present'
  end

  test "has_many association" do
    assert_has_many User, :articles
  end
end
