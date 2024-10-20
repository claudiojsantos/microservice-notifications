class NotificationsController < ApplicationController
  def create
    notification = Notification.new(notification_params)

    if notification.save
      render json: { message: "Notification receives successfully" }, status: :ok
    else
      render json: { error: "Failed to receive Notification" }, status: :unprocessable_entity
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:title, :message, :status)
  end
end
