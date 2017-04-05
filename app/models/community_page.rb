class CommunityPage < PushType::Node
  has_child_nodes :challenge, :tile

  field :blog_post, :structure do
    field :title,    :string, validates: { presence: true }
    field :url,      :string, validates: { presence: true }

    include ImageNode
  end

  def challenges
    children.published.where(type: "Challenge")
  end
end
