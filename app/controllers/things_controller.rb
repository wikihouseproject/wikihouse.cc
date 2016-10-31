class ThingsController < ApplicationController
  def index
    redirect_to thing_path('microhouse')
  end
end
