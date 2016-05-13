class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.


  # custom 404
  # unless Rails.application.config.consider_all_requests_local
  #   rescue_from ActiveRecord::RecordNotFound,
  #               ActionController::RoutingError,
  #               ActionController::UnknownController,
  #               AbstractController::ActionNotFound,
  #               ActionController::MethodNotAllowed do |exception|
  #
  #     # Put loggers here, if desired.
  #
  #     redirect_to '/apps/texty/update_phone'
  #   end
  # end

  protect_from_forgery with: :exception
end
