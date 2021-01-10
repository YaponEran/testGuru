module QuestionsHelper
  def form_header(question)
    if @question.new_record?
      "Create new  #{question.title} question"
    else
      "Edit #{question.title} question"
    end
  end
end
