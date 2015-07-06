class UsersController < ApplicationController

  def index
    @user = User.all
    render json: { user: @user.as_json(only: [:id, :email]) },
           status: :ok

  end



  def show
    @user = User.find(params[:user_id])
    render json: { user: @user.as_json(only: [:id, :email, :access_token]) }
  end

  def register
    passhash = password_encryption(params[:password])
    @user = User.new(email: params[:email],
                     password: passhash)
    if @user.save
      # render json "register.json.jbuilder", status: :created
      render json: { user: @user.as_json(only: [:id, :email, :access_token]) },
             status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def login
    passhash = Digest::SHA1.hexdigest(params[:password])
    @user = User.find_by(email: params[:email], password: passhash)

    if @user
      # render json "register.json.jbuilder", status: :created
      render json: { user: @user.as_json(only: [:id, :email, :access_token]) },
             status: :ok
    else
      render json: {message: "Wrong email/password"},
             status: :unprocessable_entity
    end
  end

  private
  def password_encryption(password)
    if !password.nil? && password != ""
      result = Digest::SHA1.hexdiget(password)
    else
      result = nil
    end
    result
  end
end