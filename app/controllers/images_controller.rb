class ImagesController < ApplicationController
  def update_avatar
    @avatar = User.find(params[:user_id])
    @upload = @avatar.users.update(avatar_file_name: params[:avatar_file_name],
                                   avatar_content_type: params[:avatar_content_type],
                                   avatar_file_size: params[:avatar_file_size])

    if @upload.save
      render json: { file: @upload },
             status: :ok
    else
      render json: { errors: @upload.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def create_image
    @profile = Profile.find(params[:profile_id])
    @image = @profile.images.new(image_url: params[:image_url],
                                 imageable_type: params[:imageable_type])
    if @image.save
      render json: @image,
             status: :ok
    else
      render json: {errors: @image.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def show_image
    @profile = Profile.find(params[:profile_id])
    @image = @profile.images.find(params[:image_id])
    render json: @image,
           status: :ok
  end

  def index_image
    @image = Image.all
    render json: @image,
           status: :ok
  end
end
