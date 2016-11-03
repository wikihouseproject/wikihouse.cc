class ProposalForm < Reform::Form

  property :role
  property :name
  property :organisation
  property :email_address
  property :country
  property :description
  property :has_site
  property :has_budget
  property :has_planning
  property :has_mortgage
  property :services_required
  property :anything_else

  validates :name, presence: true
end
