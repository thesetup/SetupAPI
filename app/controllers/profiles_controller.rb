class ProfilesController < ApplicationController
  def create
    @profile = Profile.new(profilee_id: User.find_by(email: params[:email],
                           profiler_id: current_user))
    if @profile.save
      # render json "register.json.jbuilder", status: :created
      render json: @profile.as_json,
             status: :created
    else

      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def index
    @profile = Profile.all
    render json: @profile.as_json,
           status: :ok
  end
end