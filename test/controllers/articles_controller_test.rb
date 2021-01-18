require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:article_one)
  end

  test "gets the index page" do
    get articles_url
    assert_response :success
  end

  test "guest users cannot view article show page" do
    get article_url(@article)
    assert_redirected_to new_user_session_url
  end

  test "vanilla users can view article show page" do
    get new_user_session_url
		sign_in users(:vanilla_user)

    get article_url(@article)
    assert_response :success
  end

  test "editor users has access to the new article page" do
    get new_user_session_url
		sign_in users(:editor_one)

    get new_article_url
    assert_response :success
  end

  test "new article page redirects guest users to login page" do
    get new_article_url
    assert_redirected_to new_user_session_url
  end

  test "new article page redirects vanilla users to the home page" do
    get new_user_session_url
		sign_in users(:vanilla_user)

    get new_article_url
    assert_redirected_to root_url
  end

  test "new article page redirects admin to the home page" do
    get new_user_session_url
		sign_in users(:admin_user)

    get new_article_url
    assert_redirected_to root_url
  end

  test "guest users cannot create an article" do
    post articles_url, params: { article: { title: @article.title, content: @article.content, category: @article.category, user_id: @article.user_id  } }
    
    assert_redirected_to new_user_session_url
  end

  test "vanilla users cannot create an article" do
    get new_user_session_url
		sign_in users(:vanilla_user)

    post articles_url, params: { article: { title: @article.title, content: @article.content, category: @article.category, user_id: @article.user_id  } }
    
    assert_redirected_to root_url
  end

  test "admin users cannot create an article" do
    get new_user_session_url
		sign_in users(:admin_user)

    post articles_url, params: { article: { title: @article.title, content: @article.content, category: @article.category, user_id: @article.user_id  } }
    
    assert_redirected_to root_url
  end

  test "editor users can create an article" do
    get new_user_session_url
		sign_in users(:editor_one)

    assert_difference('Article.count') do
      post articles_url, params: { article: { title: @article.title, content: @article.content, category: @article.category, user_id: @article.user_id  } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "editor user can edit their article" do
    get new_user_session_url
		sign_in users(:editor_one)

    get edit_article_url(@article)
    assert_response :success
  end

  test "editor user cannot edit another users article" do
    get new_user_session_url
		sign_in users(:editor_two)
    
    get edit_article_url(@article)
    assert_redirected_to root_url
  end

  test "editor user cannot update another users article" do
    get new_user_session_url
    sign_in users(:editor_one)
    
    article = articles(:article_two)

    patch article_url(article), params: { article: { title: article.title, content: article.content, category: article.category, user_id: article.user_id  } }
    assert_redirected_to root_url
  end

  test "vanilla user cannot update an article" do
    get new_user_session_url
		sign_in users(:vanilla_user)

    patch article_url(@article), params: { article: { title: @article.title, content: @article.content, category: @article.category, user_id: @article.user_id  } }
    assert_redirected_to root_url
  end

  test "admin user cannot update an article" do
    get new_user_session_url
		sign_in users(:admin_user)

    patch article_url(@article), params: { article: { title: @article.title, content: @article.content, category: @article.category, user_id: @article.user_id  } }
    assert_redirected_to root_url
  end

  test "guest user cannot update an article" do
    patch article_url(@article), params: { article: { title: @article.title, content: @article.content, category: @article.category, user_id: @article.user_id  } }
    assert_redirected_to new_user_session_url
  end

  test "editor user can update their article" do
    get new_user_session_url
		sign_in users(:editor_one)

    patch article_url(@article), params: { article: { title: @article.title, content: @article.content, category: @article.category, user_id: @article.user_id  } }
    assert_response 302
  end

  test "editor user can delete their article" do
    get new_user_session_url
		sign_in users(:editor_one)

    assert_difference('Article.count', -1) do
      delete article_url(@article)
    end

    assert_redirected_to articles_url
  end

  test "an editor user cannot delete another users article" do
    get new_user_session_url
		sign_in users(:editor_two)

    assert_no_difference('Article.count') do
      delete article_url(@article)
    end

    assert_redirected_to root_url
  end

  test "an admin user cannot delete another users article" do
    get new_user_session_url
		sign_in users(:admin_user)

    assert_no_difference('Article.count') do
      delete article_url(@article)
    end

    assert_redirected_to root_url
  end

  test "guest user gets a redirect to login page trying to delete an article" do
    assert_no_difference('Article.count') do
      delete article_url(@article)
    end

    assert_redirected_to new_user_session_url
  end
end
