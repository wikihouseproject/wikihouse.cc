class Enquiry < ApplicationRecord

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
    :notes

  validates_presence_of :first_name, :email

end
