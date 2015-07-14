class ProfilesController < ApplicationController

  before_action :authenticate_with_token!


    def create
      ###This creates a profile using a temporary password and username
      ###that the profilee may then change later.

      @profilee = User.create(email: params[:email],
                              password: params[:password],
                              username: params[:username],)

      @profile = Profile.new(profilee_id: @profilee.id,
                             profiler_id: current_user.id)

      @profile.questions.new(birthyear: params[:birthyear],
                             email: params[:email],
                             name: params[:username],
                             gender: params[:gender],
                             orientation: params[:orientation],
                             occupation: params[:occupation],
                             location: params[:location])

      @profile.videos.new(video_url: params[:video_url],
                          videoable_type: params[:videoable_type])

      @profile.images.new(image_url: params[:image_url],
                          imageable_type: params[:imageable_type])

                          ##I don't think Videos and Images are being saved to
                          ##a Profile.


      if @profile.save

        render 'create.json.jbuilder'
        #UserMailer.welcome.deliver
      else
        render json: {errors: @profile.errors.full_messages},
               status: :unprocessable_entity
      end
    end

      #### NEED TO USE JBUILDER TO RETURN JSON FOR VIDEO, IMAGE AND QUESTION OBJECTS.

    def index
      @profile = Profile.all
      @image = Image.all
      @video = Video.all
      @question = Question.all
      render 'index.json.jbuilder'
    end

    def show
      @profile = Profile.find(params[:id])
      render 'show.json.jbuilder', status: :ok
    end

    def destroy
      @profile = Profile.find(params[:id])
        if @profile.author == current_user
          @profile.destroy
          render json: {message: "Profile deleted."},
                 status: :ok
        else
          render json: {message: "Only the author of a profile may delete a profile."},
                 status: :unauthorized
        end
    end

    def update
      @image = Image.find(params[:id])
      if @image.user == current_user
        @image.update(image_params)
      else
        flash[:alert] = 'Only the author of a post may change the post.'
      end
    end

  private
  def user_params
    params.require(:user).permit(:avatar, :name)
  end

  def image_params
    params.require(:image_url).permit(:imageable_id)
  end

end
