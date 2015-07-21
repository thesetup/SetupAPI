class QuestionsController < ApplicationController
  def search
    search_text = params[:keywords]
    @questions = Question.search(search_text)
    if @questions.present?
      render 'search.json.jbuilder', status: :ok
    else
      render json: { message: "Oops! There might be a typo! Please search again" },
             render: :not_found
    end
  end
end
