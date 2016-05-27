class UserMailer < ApplicationMailer
  default from: 'CrypticInlet@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'https://floating-ridge-94894.herokuapp.com'
    mail(to: @user.email, subject: 'Join My Cult...')
  end

  def order_confirmation(order)
  	@order = order
  	mail to: @user.email, subject: "Your Order Has Been Placed Successfully!"
  end
end
