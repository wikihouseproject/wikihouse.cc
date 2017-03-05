class Challenge < PushType::Node
  has_child_nodes false
  unexpose!

  field :description, :text, validates: { presence: true }
end
