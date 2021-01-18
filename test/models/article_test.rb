require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  setup do
    @article = articles(:article_two)
  end

  test "article is valid with all attributes present" do
    assert @article.valid?
  end

  test "article without the presence of title is invalid" do
    @article.title = nil

    refute @article.valid?, 'article is valid without a title'
    assert_not_nil @article.errors[:title], 'no validation error for title present'
  end

  test "article without the presence of content is invalid" do
    @article.content = nil

    refute @article.valid?, 'article is valid without a content'
    assert_not_nil @article.errors[:content], 'no validation error for content present'
  end

  test "article without the presence of category is invalid" do
    @article.category = nil

    refute @article.valid?, 'article is valid without a category'
    assert_not_nil @article.errors[:category], 'no validation error for category present'
  end

  test "article without an user is invalid" do
    @article.user_id = nil

    refute @article.valid?, 'article is valid without a user'
    assert_not_nil @article.errors[:user_id], 'no validation error for user present'
  end

  test "class method uniq_categories" do
    categories = Article.uniq_categories

    assert_equal ["Food", "Sports", "Fashion"], categories   
  end

  test "belongs_to association" do
    assert_belongs_to Article, :user
  end

  test "scope latest_three_articles_per category" do
    user = users(:editor_one)
    a1 = Article.new(title: 'test', content: 'testing', category: 'Sports', user: user)
    a2 = Article.new(title: 'test2', content: 'testing', category: 'Sports', user: user)
    a3 = Article.new(title: 'test3', content: 'testing', category: 'Sports', user: user)

    articles = Article.latest_three_articles_per('Sports')

    assert_equal articles.length, 3
  end
end
