class PartnersPage < PushType::Node
  has_child_nodes :partner, :tile

  field :pricing_table, :markdown, validates: { presence: true }

  def tiles
    children.published.where(type: "Tile")
  end
end
