require 'test_helper'

class CreateUserTest < ActionDispatch::IntegrationTest


  setup do
    @user = User.create(username: "johndoe55", email: "johndoe5@example.com",
                  password: "password", id: " " , admin: false)
 end

  test "get new user form and create new user" do
        get "/users/#{@user.id}" 
        assert_response :success
        assert_difference 'User.count', 1 do 
          post users_path, params: { user: { username: "Naomi88", email: "naomi88@gmail.com",
            password: "password"} }
          assert_response :redirect
        end
        follow_redirect! 
        assert_response :success
        assert_match "Naomi88", response.body
      end
end

