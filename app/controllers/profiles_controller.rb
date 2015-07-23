class ProfilesController < ApplicationController

  before_action :authenticate_with_token!

  def create
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


    begin
      ActiveRecord::Base.transaction do
        @question.save!
        @profilee.save!
        @profile.update!(profilee_id: @profilee.id)
        @profile.question = @question
      end
      render 'create.json.jbuilder'
    rescue ActiveRecord::RecordInvalid => e
      render json: { message: "Save failed: #{e.message}",
                     question: @question.errors.full_messages,
                    },
        status: :unprocessable_entity
    end
  end

  def update_profilee_avatar
    @profile = Profile.find(params[:profile_id])
    @user = @profile.user
    @user.avatar = params[:avatar]
    @user.avatar_remote_url = params[:avatar_remote_url]

    if current_user.id == @profile.author.id
      @user.save(validate: false)
      render json: { file: @user, avatar_url: @user.avatar.url },
             status: :ok
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def index
    @profiles = Profile.all
    @videos = Video.all
    @questions = Question.all
    @users = User.all
    render 'index.json.jbuilder', status: :ok
  end

  def show
    @profile = Profile.find(params[:profile_id])
    if @profile
      render 'show.json.jbuilder', status: :ok
    else
      render json: {errors: @profile.errors.full_messages}
    end
  end

  def destroy
    @profile = Profile.find(params[:profile_id])
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
