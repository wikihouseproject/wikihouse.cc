class PartnersPage < PushType::Node
  has_child_nodes :partner, :tile

  def tiles
    children.published.where(type: "Tile")
  end
end
