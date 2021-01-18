class TestPassagesController < ApplicationController
  
  before_action :authenticate_user!
  before_action :find_test_passages, only: %i[show result update]
  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private
  def find_test_passages
    @test_passage = TestPassage.find(params[:id])
  end
end
