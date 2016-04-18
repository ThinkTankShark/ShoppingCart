class UserMailer < ApplicationMailer
  default from: 'CrypticInlet@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'https://floating-ridge-94894.herokuapp.com'
    mail(to: @user.email, subject: 'Join My Cult...')
  end
end
