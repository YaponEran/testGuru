class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_answer -> {where(correct: true)}

  validates :body, presence: true
  validate :validate_answer_size

  private
  def validate_answer_size
    errors.add(:question) if question.answers.count > 4
  end
end
