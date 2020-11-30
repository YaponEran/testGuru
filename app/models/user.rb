class User < ApplicationRecord
  has_many :tests through: :user_tests
  def pass_tests_by_level(level)
    Test.joins("INNER JOIN ON user_tests ON tests.id = user_tests.test_id")
    .where(level: level, user_tests: {user_id: id})
  end
end
