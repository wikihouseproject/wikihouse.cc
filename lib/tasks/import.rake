require 'nokogiri'
require 'open-uri'
require 'json'

namespace :import do

  task products: :environment do
    JSON.parse(open('data/products.json').read).each_with_index do |product, index|
      p =Product.find_or_initialize_by(name: product['name']) do |p|
        p.ordinal = index
        p.color = product['color']
        p.icon = product['icon']
        p.save!
      end
    end
  end

end
