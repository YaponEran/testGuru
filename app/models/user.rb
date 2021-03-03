class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  
  has_many :own_tests, class_name: "Test", foreign_key: :author_id, dependent: :nullify
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges
  
  def test_by_level(level)
    tests.level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id) 
  end
  
  def admin?
    self.is_a?(Admin)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
  
end
