class Tile < PushType::Node
  has_child_nodes false
  unexpose!

  field :content, :markdown

  field :link_text, :string, validates: { presence: true }
  field :link_url,  :string, validates: { presence: true }

  field :background_image_id, :asset
  field :background_color,    :string

  field :dark_text, :boolean
end
