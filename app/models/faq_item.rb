class FaqItem < PushType::Node
  has_child_nodes false
  unexpose!

  field :content, :markdown, validates: { presence: true }
end
