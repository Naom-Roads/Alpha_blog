require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest
 
  setup do

    @user = User.create(username: "johndoe55", email: "johndoe5@example.com",
      password: "password", id: " " , admin: false)

    sign_in_as(@user)
 end

#     @article = Article.new(title: "Article 123", description: "Article 1")
#     post article
    

#  end
 
 
  test "Get new article form and create article" do
    get "/articles"
    assert_response :success
    assert_difference 'Article.count', 1 do 
      post articles_path, params: { article: { title: "Article 123", description: "Article5453434543254562456564656535465474745534"} }
      assert_response :redirect
    end
    follow_redirect! 
    assert_response :success
    assert_match "Article 1", response.body
  end
  end

