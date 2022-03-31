class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  default from: 'eric@gmx.com'

  def welcome(user)

    @greeting = "Hi"
    @user = user # Instance variable => available in view
    mail(to: @user.email, subject: 'Welcome to Le Wagon')

    #@user = params[:user]
    #@offer = params[:offer]
    #mail to: "dthgespenst@gmx.de"
  end
end
