class ImagesController < ApplicationController
  def update_avatar
    @user = current_user
    @user.avatar = params[:avatar]

    if @user.save
      render json: { file: @user },
             status: :ok
    else
      render json: { errors: @user.errors.full_messages },
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
