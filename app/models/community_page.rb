class CommunityPage < PushType::Node
  has_child_nodes :challenge

  field :blog_post, :structure do
    field :title,    :string, validates: { presence: true }
    field :url,      :string, validates: { presence: true }
    field :image_id, :asset,  validates: { presence: true }
  end
end
