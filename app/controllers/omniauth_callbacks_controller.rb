class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter
    generic_callback('twitter')
  end

  def generic_callback(provider)
    @identity = Identity.find_for_oauth(env["omniauth.auth"])
    @user = @identity.user || @identity.create_user
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
