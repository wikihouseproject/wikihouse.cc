class ThingsController < ApplicationController
  def show
    @repo = Repo.first
  end
end
