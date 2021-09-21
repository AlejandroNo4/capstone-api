module CurrentUserConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
  end

  def set_current_user
    @current_user ||= User.includes(:trips).find_by_id(session[:user_id]) if session[:user_id]
  end
end
