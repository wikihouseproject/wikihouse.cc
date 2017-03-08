class LibraryTechnologiesCategory < PushType::Node
  has_child_nodes :library_technologies_subcategory

  field :description, :text, validates: { presence: true }

  include ImageNode

  def items
    children.published
  end
end
