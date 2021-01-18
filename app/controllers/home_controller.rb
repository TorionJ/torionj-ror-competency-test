class HomeController < ApplicationController
  def index
    @categories = Article.uniq_categories
  end
end
