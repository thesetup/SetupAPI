class ProfilesController < ApplicationController

  before_action :authenticate_with_token!

    def create
      ###This creates a profile using a temporary password and username
      ###that the profilee may then change later.

      @profilee = User.create(email: params[:email],
                              password: params[:password],
                              username: params[:username])

      @profile = Profile.new(profilee_id: @profilee.id,
                             profiler_id: current_user.id)

      @profile.questions.new(birthyear: params[:birthyear],
                             name: params[:name],
                             gender: params[:gender],
                             orientation: params[:orientation],
                             occupation: params[:occupation],
                             location: params[:location])
#binding.pry
      @profile.videos.new(video_url: params[:video_url],
                          videoable_type: params[:videoable_type])

      @profile.images.new(image_url: params[:image_url],
                          imageable_type: params[:imageable_type])

                          ##I don't think Videos and Images are being saved to
                          ##a Profile.

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
