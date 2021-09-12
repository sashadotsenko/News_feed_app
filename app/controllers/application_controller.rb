class ApplicationController < ActionController::Base
  include ErrorHandling

  private

  def user_signed_in?
    current_user.present?
  end

  helper_method :user_signed_in?
end
