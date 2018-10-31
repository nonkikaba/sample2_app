require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
    # validメソッドを使ってuserオブジェクトの有効性をチェック。
    # testは@user.valid?がtrueを返すと成功し、falseを返すと失敗
  end
end
