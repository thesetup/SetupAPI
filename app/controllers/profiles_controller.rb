class ProfilesController < ApplicationController

  before_action :authenticate_with_token!

    def create
      ###This creates a profile using a temporary password and username
      ###that the profilee may then change later.

      @user = User.find_or_create_by!(email: params[:email],
                                      password: params[:password],
                                      username: params[:username])

      @profile = Profile.new(profilee_id: @user.id,
                             profiler_id: current_user.id)

      @profile.questions.new(name: params[:name],
                             email: params[:email],
                             birthyear: params[:birthyear],
                             gender: params[:gender],
                             orientation: params[:orientation],
                             occupation: params[:occupation],
                             location: params[:location])

      @profile.videos.new(video_url: params[:video_url],
                          videoable_type: params[:videoable_type])

      @profile.images.new(image_url: params[:image_url],
                          imageable_type: params[:imageable_type])

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

      #### NEED TO USE JBUILDER TO RETURN JSON FOR VIDEO, IMAGE AND QUESTION OBJECTS.

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
