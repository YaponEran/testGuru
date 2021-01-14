class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  has_many :own_tests, class_name: 'Test', foreign_key: :author_id

  has_secure_password

  validates :email, presence: true, 
                    uniqueness: true, 
                    format: {
                      with:  with: URI::MailTo::EMAIL_REGEXP,
                      message: 'Invalid email format!'                                        
                    }

  validates :username, presence: true
  validates :password, presence: true
  validates :password, confirmation: true

  def test_by_level(level)
    tests.level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
