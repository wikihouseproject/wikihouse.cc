class Proposal < ApplicationRecord
  attr_accessor :organisation,
    :role,
    :email_address,
    :country,
    :description,
    :has_site,
    :has_budget,
    :has_planning,
    :has_mortgage,
    :has_mortgage,
    :services_required,
    :anything_else
end
