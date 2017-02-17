class Enquiry < ApplicationRecord

  attr_accessor :subtitle

  store_accessor :data,
    :organisation,
    :description,
    :message,
    :phone,
    :requested_speaker,
    :date_of_event,
    :about_event,
    :expenses,
    :speaking_fee,
    :notes,
    :role,
    :wants_to,
    :event_name,
    :budget

  # validates_presence_of :first_name, :email

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
