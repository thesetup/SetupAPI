class QuestionsController < ApplicationController
  def search
    search_text = params[:keywords]
    @questions = Question.search(search_text)

    @profiles = []
    @questions.map do |q|
      @profiles << q.profile
    end

    #@profiles = Profile.search(search_text)
    if @questions.present?
      render 'search.json.jbuilder', status: :ok
      # render json: @questions.to_json(:include => :profile)

    else

      render json: { message: "Oops! Maybe nothing matches your search. Please search again." },
             render: :not_found
    end
  end
end
