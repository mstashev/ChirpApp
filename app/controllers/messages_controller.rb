class MessagesController < ApplicationController

  def index
    # binding.pry
    if current_user
      @chirp = Message.timeline(current_user)
    # elsif params[:user_id].exists?
    #   @chirp = User.find(params[:user_id]).posts
    else
      @chirp = Message.timeline
    end
    render json: @chirp
  end

  def create
    @chirp = Message.new(body: params['body'], user_id: User.find_by(api_token: params['api_token']).id)
    if current_user
      if @chirp.save
        render json: @chirp
      else
        render json: @chirp.errors.full_messages, status: 400
      end
    else
      require_user
    end
  end

  private

  def message_params
    params.permit(:body)
  end


end
