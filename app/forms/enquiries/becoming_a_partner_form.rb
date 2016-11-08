class BecomingAPartnerForm < Reform::Form
  include ActiveModel::ModelReflections

  property :name
  property :organsisation
  property :description

end
