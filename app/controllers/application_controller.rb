class ApplicationController < ActionController::Base
  def saved_recipe_text
    return @saved_hairstyle_exists ? "unbookmark" : "bookmark"
    helper_method :saved_hairstyle_text
  end

  # this means the user has to be signed in
before_action :authenticate_user!
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private
 # this means skip authentication when we are using devise (login)
 # or in the pages controller or when you are an admin of the site
  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
