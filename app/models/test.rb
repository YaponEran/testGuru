class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :users through: :user_tests
  def self.names_by_category(name)
    joins('JOIN categories ON categories.id = tests.category_id')
    .where(categories: {title: name}).pluck(:title)
  end
end
