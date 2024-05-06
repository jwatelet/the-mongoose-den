class UserMailer < ApplicationMailer
  default from: "notifications@the-mongoose-den.com"

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: "Welcome to the Mongoose Den")
  end
end
