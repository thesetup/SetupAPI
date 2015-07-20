class QuestionsController < ApplicationController
  def search
    search_text = params[:keywords]
    @questions = Question.search(search_text)
    render json: @questions,
           status: :ok
  end
end