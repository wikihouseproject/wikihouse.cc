require 'ostruct'

class StaticController < ApplicationController

  def about
    @about_points = AboutPoint.order(ordinal: :asc)
  end

end
