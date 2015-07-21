class QuestionsController < ApplicationController
  def search
    search_text = params[:keywords]
    @questions = Question.search(search_text)
    if @questions.present?
    render json: @questions,
           status: :ok
    else
      render json: {message: "There might be a typo! Please search again" },
             render: :not_found
    end
  end
end

