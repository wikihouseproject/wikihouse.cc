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

  validates_presence_of :first_name, :email

end
