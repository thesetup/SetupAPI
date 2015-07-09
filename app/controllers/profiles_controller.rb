class ProfilesController < ApplicationController

  before_action :authenticate_with_token!

    def create
      @user = User.find_by!(email: params[:email])
      @profile = Profile.new(profilee_id: @user.id,
                             profiler_id: current_user.id)
                          #   binding.pry
      if @profile.save
        render json: @profile.as_json,
               status: :created
      else
        render json: {errors: @profile.errors.full_messages},
               status: :unprocessable_entity
      end
    end

    def index
        @profile = Profile.all
        render json: @profile.as_json,
              status: :ok
    end
end
