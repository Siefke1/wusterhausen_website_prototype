class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @offers = current_user.offers
  end
end
