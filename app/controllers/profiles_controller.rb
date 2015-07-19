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

                                ###Questions are saving w/o password,
                                ###Profile not created however.

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

  def update_profilee_avatar
    @profile = Profile.find(params[:profile_id])
    @user = @profile.user
    @user.avatar = params[:avatar]

    if current_user.id == @profile.author.id
      @user.save(validate: false)
      render json: { file: @user },
             status: :ok
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def index
    render 'index.json.jbuilder'
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
