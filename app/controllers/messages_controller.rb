class MessagesController < ApplicationController
  before_action :authenticate_user!
  # 自分のメッセージであるかどうかをチェックする
  before_action :correct_user, only: %i[edit update destroy]

  def index
    @messages = Message.includes(:user)
    @liked_message_ids = current_user.likes.pluck(:message_id)
  end

  def new
    @message = Message.new
  end

  def create
    current_user.messages.create!(message_params)
    redirect_to root_path
  end

  def edit
    # before_action :correct_user, only: %i[edit update destroy]
    # で既に@messageを呼び出しているので記述不要
    # @message = current_user.messages.find_by(id: params[:id])
  end

  def update
    @message.update!(message_params)
    redirect_to root_path
  end

  def destroy
    @message.destroy!
    redirect_to root_path
  end

  private

# mesaageパラムスの中にいろいろ値が入っているがcontentのみを取り出す
  def message_params
      params.require(:message).permit(:content)
  end

  def correct_user
    @message = current_user.messages.find_by(id: params[:id])
    redirect_to root_path if @message.nil?
  end


end
