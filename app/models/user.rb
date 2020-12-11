class User < ApplicationRecord
  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests

  has_many :own_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true

  def test_by_level(level)
    tests.level(level)
  end
end
