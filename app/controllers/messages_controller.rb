class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.includes(:user)
  end

  def new
    @message = Message.new
  end

  def create
    binding.pry
    current_user.messages.create!(message_params)
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def message_params
      params.require(:message).permit(:content)
  end
end
