class DashboardsController < ApplicationController
  def show
    @user = current_user
    @offers = current_user.offers
  end
end
