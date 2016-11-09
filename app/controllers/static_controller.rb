class StaticController < ApplicationController

  def donate
    @names = 100.times.map{ Faker::Name.name }
  end

  def google
    render 'nothing', layout: 'google'
  end

end
