class AccountsController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @account = User.new
  end

  def create
    raise
    @account = User.new('test@example.com', :password => 'password', :password_confirmation => 'password')

    if @account.save!
      notice 'new user created'
      redirect_to root_path
    else
      raise
      render "new"
    end

  end

  private

  def account_params
    params.require(:account).permit(:email, :password, :password_confirmation)
  end

end
