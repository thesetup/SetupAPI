class ProfilesController < ApplicationController

  before_action :authenticate_with_token!
  # before_action :check_validation, only: [:_video]
  # before_action :max_video_count


  # def update_delete_video_check
  #   unless videoable.videos.count <= 4
  #     errors.add(:base, "Already have maximum number of videos")
  #   end
  # end
  #
  # def create_video_check
  #   unless videoable.videos.count < 3
  #     errors.add(:base, "Already have maximum number of videos")
  #   end
  # end

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

    if @profile.save

      render 'create.json.jbuilder'
      #UserMailer.welcome.deliver
    else
      render json: {errors: @profile.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def create_video
    @profile = Profile.find(params[:profile_id])
    @video = @profile.videos.new(video_url: params[:video_url],
                                 videoable_type: params[:videoable_type],
                                 caption: params[:caption],

                                 thumbnail_url: params[:thumbnail_url])


###CURRENTLY WHEN A PROFILER CREATES A NEW VIDEO THE max_video_count VALIDATION
###IS WORKING, BUT IT'S NOT RETURING THE ERROR MESSAGE.  HTTP STATUS CODE IS 200 OK

    if current_user.id == @profile.author.id
      @video.save
      render json: @video,    status: :ok
    else
      render json: {errors: @video.errors.full_messages},
               status: :unprocessable_entity
    end
  end

  def update_video
    @profile = Profile.find(params[:profile_id])
    @video = @profile.videos.find(params[:video_id])

    if current_user.id == @profile.author.id
      binding.pry
      @video.update(video_url: params[:video_url],
                    caption: params[:caption],
                    thumbnail_url: params[:thumbnail_url])

      render json: @video, status: :ok
    else
      render json: {errors: @video.errors.full_messages},
               status: :unprocessable_entity
    end
  end

  def delete_video
    @profile = Profile.find(params[:profile_id])
    @video = @profile.videos.find(params[:video_id])

    if current_user.id == @profile.author.id
      @video.destroy

      render json: @video, status: :ok
    else
      render json: {errors: @video.errors.full_messages},
               status: :unprocessable_entity
    end

  end

  def show_video
    @profile = Profile.find(params[:profile_id])
    @video = @profile.videos.find(params[:video_id])
    render json: @video,
           status: :ok
  end

  def index_videos
    @video = Video.all
    render json: @video,
           status: :ok
  end

  def index
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

  # private

  # def user_params
  #   params.require(:user).permit(:avatar, :name)
  # end
  #
  # def image_params
  #   params.require(:image_url).permit(:imageable_id)
  # end

end
