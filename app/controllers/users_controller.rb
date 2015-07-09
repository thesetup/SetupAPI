class UsersController < ApplicationController

  def index
    @user = User.all
    render json: @user.as_json,
           status: :ok
  end

  def show
    @user = User.find(params[:user_id])
    render json: @user.as_json(only: [:id, :email, :access_token]),
           status: :ok
  end

  def register
    @user = User.new(email: params[:email],
                     password: params[:password])
    if @user.save
      # render json "register.json.jbuilder", status: :created
      render json: @user.as_json,
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
      render json: @user.as_json,
             status: :ok
    else
      render json: {message: "Wrong email/password"},
             status: :unprocessable_entity
    end
  end

end
