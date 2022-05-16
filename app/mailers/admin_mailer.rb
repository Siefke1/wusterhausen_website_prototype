class AdminMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.welcome.subject
  #
  def welcome
    @greeting = "Hi"
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to Le Wagon')
  end
  def inactive
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to Le Wagon')
  end

  def article
    @user = User.find(Article.last.user_id) # Instance variable => available in view
    mail(to: @user.email, subject: 'Danke für deinen Post.')
  end

end
