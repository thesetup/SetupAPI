class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users,
           status: :ok
  end

  def show
    @user = User.find(params[:user_id])
      render json: @user, 
           status: :ok
  end

  def profiles
    @profiles = User.find(params[:user_id]).created_profiles
    render 'profiles.json.jbuilder',
            status: :ok
  end

  def register
    @user = User.new(username: params[:username],
                     email: params[:email],
                     password: params[:password])
    if @user.save
      render 'register.json.jbuilder',
              status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def login
    hash_pass = Digest::SHA1.hexdigest(params[:password])
    @user = User.find_by(email: params[:email], password: hash_pass)
    if @user
      render json: @user, include: :made_profile, except: :password,
             status: :ok
    else
      render json: {message: "Wrong email/password"},
             status: :unprocessable_entity
    end
  end

  def update_self_avatar
    @user = User.find(params[:user_id])
    @user.avatar = params[:avatar]
    if current_user.id == @user.id
      @user.save(validate: false)
      @user.avatar_url = @user.avatar.url
      render json: { file: @user },
             status: :ok
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def delete
    @user = User.find(params[:user_id])
    if @user == current_user
      @user.destroy
      render json: {message: "User deleted"},
             status: :ok
    else
      render json: {message: "Only the author of an account may delete an account."},
             status: :unauthorized
    end
  end

end
