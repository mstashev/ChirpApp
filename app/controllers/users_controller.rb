class UsersController < ApplicationController
  before_action :require_user, only: [:follow]

  def show
    @user = User.find_by(api_token: params['api_token'])
    # binding.pry
    messages = @user.messages.each do |message|
      {:message => message}
    end
    user_message_hash = {'user' => @user, 'messages' => messages}
    render json: user_message_hash
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, serializer: UserExtendedSerializer
    else
      render json: @user.errors.full_messages, status: 400
    end
  end

  def follow
    if current_user
      # binding.pry
      current_user.toggle_follow!(User.find(params[:user_id]))
      if current_user.follows?(User.find_by(id: params[:user_id]))
        render json: ["#{current_user.name} is now following #{User.find_by(id: params[:user_id]).name}."]
      else
        render json: ["#{current_user.name} has unfollowed #{User.find_by(id: params[:user_id]).name}."]
      end
    else
      require_user
    end
  end

  private

  def user_params
    params.permit(:name, :username_email, :avatar_url, :password)
  end


end
