class ApplicationController < ActionController::Base
  protect_from_forgery

  def cms_content?
    params[:cms]
  end
  helper_method :cms_content?
end
