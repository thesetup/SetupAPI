class ImagesController < ApplicationController
  before_action :authenticate_with_token!

  def update_avatar
    @user = User.find(params[:user_id])
    @user.avatar = params[:avatar]
#binding.pry
#Avatar is currently saving to the user passed in the path parameter,
#but also changes that user's password every time a new avatar is patched.
    if @user.save!
      render json: { file: @user },
             status: :ok
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def show_avatar

  end

  def create_image
    @profile = Profile.find(params[:profile_id])
    if @profile.images.count < 1
    @image = @profile.images.new(image_url: params[:image_url],
                                 imageable_type: params[:imageable_type])
      if current_user.id == @profile.author.id
        @image.save
        render json: @image,
               status: :ok
        else
          render json: {errors: @image.errors.full_messages},
                status: :unprocessable_entity
        end
      else
      render json: {message: "There is already 1 image on this profile."},
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


  def update_image
    @profile = Profile.find(params[:profile_id])
    @image = @profile.images.find(params[:image_id])

    if current_user.id == @profile.author.id
      @image.update(image_url: params[:image_url])

      render json: @image, status: :ok
    else
      render json: {errors: @image.errors.full_messages},
             status: :unprocessable_entity
    end
  end
end
