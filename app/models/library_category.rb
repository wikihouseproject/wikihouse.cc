class LibraryCategory < PushType::Node
  has_child_nodes :library_item

  field :description, :text, validates: { presence: true }

  include ImageNode

  def items
    children.published
  end
end
