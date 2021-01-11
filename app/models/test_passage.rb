class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validate_set_first_question, on: :create
  before_validation :before_validate_set_next_question, on: :update

  POINST_TO_COMPLETE = 85

  def accept!(answers_ids)
    if correct_answer?(answers_ids)
      self.correct_questions += 1
    end
    save!
  end

  def completed?
    current_question.nil?
  end

  def score
    correct_questions * 100.0 / test.questions.count
  end

  def passed?
    score >= POINST_TO_COMPLETE
  end

  def question_index
    test.question.index(current_question) + 1
  end

  private

  def before_validate_set_first_question
    self.current_question = test.question.first
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    self.current_question.answers.correct
  end

  def before_validate_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', self.current_question.id).first
  end

end
