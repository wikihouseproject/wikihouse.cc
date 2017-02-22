class Partner < PushType::Node
  has_child_nodes false
  unexpose!

  field :link, :string
  field :image_id, :asset

  validates :link,     presence: true
  validates :image_id, presence: true
end
