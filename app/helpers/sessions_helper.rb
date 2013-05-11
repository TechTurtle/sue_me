module SessionsHelper

  def sign_out(user)
    user.remember_token = SecureRandom.urlsafe_base64
  end
end
