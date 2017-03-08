class PressArticle < PushType::Node
  has_child_nodes false
  unexpose!

  field :link, :string, validates: { presence: true }

  include ImageNode
end
