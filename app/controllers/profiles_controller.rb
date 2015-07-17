class ProfilesController < ApplicationController

  before_action :authenticate_with_token!

  def create
    #binding.pry
    @profilee = User.new(email: params[:email],
                            password: params[:password],
                            username: params[:username])

    @profile = Profile.new(profilee_id: @profilee.id,
                           profiler_id: current_user.id)

    @question = Question.new(birthyear: params[:birthyear],
                                email: params[:email],
                                name: params[:username],
                                gender: params[:gender],
                                orientation: params[:orientation],
                                occupation: params[:occupation],
                                location: params[:location])

    if @question.save
      if @profilee.save
         @profile.update(profilee_id: @profilee.id)
        if @profile.save
           @profile.question = @question
           render 'create.json.jbuilder'
        else
           render json: {errors: @profile.errors.full_messages},
                  status: :unprocessable_entity
        end
      else
        render json: {errors: @profilee.errors.full_messages},
                status: :unprocessable_entity
      end
      #UserMailer.welcome.deliver
    else
      render json: {errors: @question.errors.full_messages},
              status: :unprocessable_entity
    end
  end

  def create_video
    @profile = Profile.find(params[:profile_id])
    if @profile.videos.count < 4
      @video = @profile.videos.new(video_url: params[:video_url],
                                   videoable_type: params[:videoable_type],
                                   caption: params[:caption],

                                   thumbnail_url: params[:thumbnail_url])

      if current_user.id == @profile.author.id
        @video.save
        render json: @video, status: :ok
      else
        render json: {errors: @video.errors.full_messages},
                 status: :unprocessable_entity
      end
    else
      render json: {message: "There are already 4 videos on this profile."},
                status: :unprocessable_entity
    end
  end

  def update_video
    @profile = Profile.find(params[:profile_id])
    @video = @profile.videos.find(params[:video_id])

    if current_user.id == @profile.author.id
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
    if @profile
      render 'show.json.jbuilder', status: :ok
    else
      render json: {errors: @profile.errors.full_messages}
    end
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

end
