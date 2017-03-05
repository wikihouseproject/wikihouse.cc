class PressArticle < PushType::Node
  has_child_nodes false
  unexpose!

  field :link,     :string, validates: { presence: true }
  field :image_id, :asset,  validates: { presence: true }

  def image_url
    image.file.url
  end
end
