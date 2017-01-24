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
    :event_name

  # validates_presence_of :first_name, :email

  def country_name
    country = ISO3166::Country[data['country']]
    country.translations[I18n.locale.to_s] || country.name
  end

  def salesseek_payload
    {
      first_name: first_name,
      last_name: last_name,
      organization: {name: organisation},
      roles: [{title: role}],
      comments: "Automatically added via enquiry form ##{id}",
      communication: [
        {
          medium: "email",
          value: email
        }
      ]
      # locations: [{
      #   name: "Office",
      #   address: "United Kingdom"
      # }]
    }
  end

end
