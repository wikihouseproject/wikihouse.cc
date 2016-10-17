class Enquiry < ApplicationRecord

  store_accessor :data,
    :name,
    :organisation,
    :email,
    :description,
    :message,
    :phone,
    :requested_speaker,
    :date_of_event,
    :about_event,
    :expenses,
    :speaking_fee,
    :notes

end
