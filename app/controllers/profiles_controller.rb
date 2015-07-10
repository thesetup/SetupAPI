class ProfilesController < ApplicationController

  before_action :authenticate_with_token!

    def create
      @user = User.create(email: params[:email],
                          username: params[:username],
                          password: params[:password])
                          
      @profile = Profile.new(profilee_id: @user.id,
                             profiler_id: current_user.id)
        #### something isn't working with the validation to prevent a
        #### profiler and profilee having the same id
      if @profile.save
        render json: @profile.as_json,
               status: :created
      else
        render json: {errors: @profile.errors.full_messages},
               status: :unprocessable_entity
      end
    end

    def create_question

      @profile = Profile.find_by(current_user.profile.id)
      binding.pry
      @question = @profile.questions.new(name: params[:name],
                                        email: params[:email],
                                        birthyear: params[:birthyear],
                                        gender: params[:gender],
                                        orientation: params[:orientation],
                                        occupation: params[:occupation],
                                        location: params[:location])

        if @question.save
          render json: @question.as_json,
               status: :created
        else
          render json: {errors: @question.errors.full_messages},
               status: :unprocessable_entity
        end

    end

  def index
    @profile = Profile.all
    render json: @profile,
           status: :ok
  end

  def show
    @profile = Profile.find(params[:profile_id])
    render json: @profile,
           status: :ok
  end

end
