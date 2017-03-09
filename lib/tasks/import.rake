require 'nokogiri'
require 'open-uri'
require 'json'

namespace :import do

  task about_points: :environment do
    JSON.parse(open('data/about.json').read).each_with_index do |point, index|
      AboutPoint.find_or_initialize_by(name: point['title']).tap do |ap|
        ap.ordinal = index
        ap.description = point['description']
        ap.save!
      end
    end
  end

end
