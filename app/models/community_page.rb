class CommunityPage < PushType::Node
  has_child_nodes :challenge

  field :blog_post, :structure do
    field :title,    :string, validates: { presence: true }
    field :url,      :string, validates: { presence: true }
    field :image_id, :asset,  validates: { presence: true }

    def image_url
      image.file.url
    end
  end

  def challenges
    children.published.where(type: "Challenge")
  end
end
