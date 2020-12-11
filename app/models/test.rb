class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy

  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :level, -> (level) { where(level: level) }

  scope :by_category, -> (name) { joins(:category).where(categories: {title: name}) }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def self.names_by_category(name)
    joins('JOIN categories ON categories.id = tests.category_id')
    .where(categories: {title: name}).pluck(:title)
  end
end
