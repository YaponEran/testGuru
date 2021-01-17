class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :own_test, class_name: "Test", foreign_key: :author_id

  validates :email, presence: true, 
                    format: {
                      with: URI::MailTo::EMAIL_REGEXP,
                      message: 'Invalid email format!'                                        
                    }

  validates :password, presence: true
  validates :password, confirmation: true

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
