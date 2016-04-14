class UserMailer < ApplicationMailer
  default from: 'mrwhite@sealthedeal.com'

  def welcome_email(user)
    @user = user
    @url = 'https://cryptic-inlet-68243.herokuapp.com/'
    mail(to: @user.email, subject: 'Join My Cult...')
  end
end
