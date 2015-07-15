class ProfilesController < ApplicationController

  before_action :authenticate_with_token!
    # before_save :check_video_count


  def create
    ###This creates a profile using a temporary password and username
    ###that the profilee may then change later.

    @profilee = User.new(email: params[:email],
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

    # @profile.videos.new(video_url: params[:video_url],
    #                     videoable_type: params[:videoable_type],
    #                     caption: params[:caption],
    #                     thumbnail_url: params[:thumbnail_url])

    # @profile.images.new(image_url: params[:image_url],
    #                     imageable_type: params[:imageable_type])

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
    if @video.save
      render json: @video,    status: :ok
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


    ####Profile cannot own more than 4 videos.  Can only own 1 main video.
    ####@profile.videos.main == false if @profile.videos.count > 1
    ####If main == false, @profile.video == 10 sec video.
    ####if @profile.videos.count > 4 render error json msg.
    ####

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


  #   def update
  #     @image = Image.find(params[:id])
  #     if @image.user == current_user
  #       @image.update(image_params)
  #     else
  #       flash[:alert] = 'Only the author of a post may change the post.'
  #     end
  #   end
  #
  # private

  def check_video_count
    @profile = Profile.find(params[:id])
    if @profile.videos.count > 4
      render json: {message: "A profile may not own more than 4 videos."}
    end
  end

  # def user_params
  #   params.require(:user).permit(:avatar, :name)
  # end
  #
  # def image_params
  #   params.require(:image_url).permit(:imageable_id)
  # end

end
