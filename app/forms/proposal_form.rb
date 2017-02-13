class ProposalForm < Reform::Form
  include ActiveModel::ModelReflections

  property :role
  property :name
  property :organisation
  property :email_address
  property :country
  property :description
  property :has_site
  property :budget
  property :has_planning
  property :has_mortgage
  property :services_required
  property :anything_else

  # validates :name,
  #           :email_address,
  #           :role,
  #           :country,
  #           :has_site,
  #           :has_budget,
  #           :has_planning,
  #           :has_mortgage,
  #           presence: true

end
