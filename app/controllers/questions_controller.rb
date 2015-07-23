class QuestionsController < ApplicationController
  def search
    search_text = params[:keywords]
    # min_age = params[:min_age].to_i
    # max_age = params[:max_age].to_i

    # question_by_search = Question.search(search_text)
    # question_by_age = Question.where(birthyear: (DateTime.now.utc.year-max_age)..(DateTime.now.utc.year - min_age))
    # @questions = (question_by_search & question_by_age)

    @questions = Question.search(search_text)
    # .where(birthyear: (DateTime.now.utc.year-max_age)..(DateTime.now.utc.year-min_age))
    @profiles = []
    @questions.map do |q|
      @profiles << q.profile
    end

    if @questions.present?
      render 'search.json.jbuilder', status: :ok
    else

      render json: { message: "Oops! Maybe nothing matches your search. Please search again." },
             render: :not_found

    end
  end
end
