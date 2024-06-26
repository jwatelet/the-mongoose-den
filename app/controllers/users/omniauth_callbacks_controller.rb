class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.create_from_github(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: "Github") if is_navigational_format?
    else
      flash[:error] = "There was a problem signing you in through Github. Please register or try signing in later."
      redirect_to new_user_registration_url
    end
  end

  def google_oauth2
    @user = User.create_from_google(request.env["omniauth.auth"])

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: "Google"
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"].except("extra") # Removing extra as it can overflow some session stores
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end

  def failure
    flash[:error] = "There was a problem signing you in. Please register or try signing in later."
    redirect_to new_user_registration_url
  end
end
