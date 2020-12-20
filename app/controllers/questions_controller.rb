class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  rescue_form ActiveRecord::RecordNotFound, with: :rescue_question_not_found

  def index
    @questions = Question.all
    render json: @questions
  end

  def show
    render inline: "<li> <%= @question.body %> </li>"
  end

  def new
    @questions = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to test_question_path
    else
      render :new
    end
  end

  def destroy
     @question.destroy
  end

  private
  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end
  
  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_question_not_found
    render plain: "Question not found"
  end
end
