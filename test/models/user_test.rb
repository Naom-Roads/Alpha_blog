require 'test_helper'

class UserTest < ActiveSupport::TestCase

def setup
    @user = User.new(username: "Naomi88", email: "naomi88@gmail.com", password: "password123")

end

test "username should be valid" do 
    assert @user.valid? 
  end 

test "username should be present" do
    @user.username =  " "
    assert_not @user.valid? 
end

test "username should be unique" do
    @user.save 
    @user2 = User.new(username: "Naomi88")
    assert_not @user2.valid?

 end

test "username should not be too long" do 
    @user.username = "a" * 26 
    assert_not @user.valid?

end

test "username should not be too short" do
 @user.username = "aa"
 assert_not @user.valid? 

end

end