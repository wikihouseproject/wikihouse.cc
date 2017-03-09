class ApplicationController < ActionController::Base
  protect_from_forgery

  # PushType raises this when a node's permalink isn't in the database
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  rescue_from ActionController::UnknownFormat, with: :render_not_found

  def render_not_found
    render html: Rails.root.join("public/404.html").read.html_safe,
           status: :not_found
  end
end
