class NotificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :action_permited?, only: %i[index]

  after_action :mark_notifications_as_read, only: %i[index]

  def index
    @notifications = User.find(params[:user_id]).notifications.most_recent.page(params[:page])
  end

  private

  def action_permited?
    redirect_to root_path, alert: "Not authorized action" if current_user.id != params[:user_id].to_i
  end

  def mark_notifications_as_read
    @notifications.each(&:mark_as_read)
  end
end
