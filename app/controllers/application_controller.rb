class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/403', alert: exception.message
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
