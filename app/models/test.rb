class Test < ApplicationRecord
  has_many :questions
  belongs_to :category

  has_many :test_pasts
  has_many :users,  through: :test_pasts

  def self.sort_by_category(categor_title)
    joins(:category).where(categories: {title: categor_title})
    .order(title: :desc)
    .pluck(:title)
  end
end
