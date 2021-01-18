class Article < ApplicationRecord
  scope :latest_three_articles_per, -> (category) { where(category: category).order(created_at: :desc).first(3) }

  belongs_to :user

  validates_presence_of :title, :content, :category

  def self.uniq_categories
    pluck(:category).uniq
  end
end