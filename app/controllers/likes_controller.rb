class LikesController < ApplicationController
  def create
    current_user.likes.create!(message_id: params[:message_id])
    redirect_to root_path
  end

  def destroy
    current_user.likes.find_by(message_id: params[:message_id]).destroy!
    redirect_to root_path
  end
end
