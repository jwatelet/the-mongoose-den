class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def action_permited?
    @user = User.find(params[:id])

    redirect_to root_path, alert: "Not authorized action" if current_user.id != @user.id
  end
end
