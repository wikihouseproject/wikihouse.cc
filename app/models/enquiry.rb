class Enquiry < ApplicationRecord

  attr_accessor :subtitle # required for invisible_captcha

  def country_name
    country = ISO3166::Country[data['country']]
    country.translations[I18n.locale.to_s] || country.name
  end

  def priority_proposal?
    kind == 'project-proposal' and
    data['country'].try(:downcase) == "gb" and
    data['has_mortgage'].try(:downcase) == "no" and
    data['budget'].try(:match, /\d+/) ? true : false
  end

end
