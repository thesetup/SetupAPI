class VideosController < ApplicationController

  def create_video
    @profile = Profile.find(params[:profile_id])
    if @profile.videos.count < 4
      @video = @profile.videos.new(video_url: params[:video_url],
                                   videoable_type: params[:videoable_type],
                                   caption: params[:caption],
                                   thumbnail_url: params[:thumbnail_url])

      if current_user.id == @profile.author.id
        @video.save
        render json: @video, status: :created
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

end
