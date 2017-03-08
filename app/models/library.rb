class Library < PushType::Node
  has_child_nodes :library_category, :library_technologies_category

  def categories
    children.published
  end
end
