class Admin::AdminController < ApplicationController
  layout false
  http_basic_authenticate_with name: ENV.fetch('admin_user'), password: ENV.fetch('admin_pass') if Rails.env.production?
end
