class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index, :show, :home, :about_us]
  include Pundit


  #after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
   # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

    #   def current_user
    #   super || guest_user
    # end

    # private

    # def guest_user
    #  User.find(session[:guest_user_id].nil? ? session[:guest_user_id] = create_guest_user.id : session[:guest_user_id])
    # end

    # def create_guest_user
    #   u = User.create(:name => "guest", :email => "guest_#{Time.now.to_i}#{rand(99)}@example.com")
    #   u.save(:validate => false)
    #   u
    # end
  # private

  # def skip_pundit?
  #   devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  # end
end
