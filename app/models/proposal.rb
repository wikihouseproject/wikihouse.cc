class Proposal < ApplicationRecord
  attr_accessor :organisation,
    :email_address,
    :country,
    :description,
    :has_site,
    :has_budget,
    :has_planning
end
