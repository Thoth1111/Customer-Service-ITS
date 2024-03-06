class UserMailer < ApplicationMailer
  def account_reactivated(user)
    @user = user
    mail(to: @user.email, subject: 'Your account has been reactivated')
  end
end
