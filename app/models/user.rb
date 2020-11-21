class User < ApplicationRecord
  has_many :test_pasts
  has_many :tests,  through: :test_pasts
  
  def usert_test_level(level)
    tests.where(level: level)
  end

end
