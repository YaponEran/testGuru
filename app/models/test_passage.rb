class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_first_question, on: :create

  # scope :passed, -> { where("result >= 85 ")}

  POINTS_TO_COMPLETE = 85

  def completed?
    current_question.nil?
  end

  def empty_answers?(answer_ids)
    answer_ids.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    self.current_question = next_question
    save!
  end

  def score
    correct_questions * 100 / test.questions.count
  end

  def passed
    score >= POINTS_TO_COMPLETE
  end

  def passed?
    score >= POINTS_TO_COMPLETE
  end

  def question_index
    test.questions.index(current_question) + 1
  end

  def time_passed
    Time.now - created_at
  end

  def time_left(test_passage)
    test_passage.test.duration - (Time.now - test_passage.created_at).to_i if test_passage.test.duration > 0
  end

  private
  def before_validation_set_first_question
    self.current_question = test.questions.first
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
     correct_answers_count == answer_ids.count 
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
  
end
