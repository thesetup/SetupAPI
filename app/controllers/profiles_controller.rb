class ProfilesController < ApplicationController

  before_action :authenticate_with_token!

    def create
      @user = User.new(email: params[:email],
                       password: params[:password])

      @profile = Profile.new(profilee_id: @user.id,
                             profiler_id: current_user.id)

      @profile.questions.new(name: params[:name],
                             email: params[:email],
                             birthyear: params[:birthyear],
                             gender: params[:gender],
                             orientation: params[:orientation],
                             occupation: params[:occupation],
                             location: params[:location])
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
