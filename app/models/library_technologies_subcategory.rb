class LibraryTechnologiesSubcategory < PushType::Node
  has_child_nodes :library_item

  field :color, :string, validates: { presence: true }

  include ImageNode

  field :full_width_image, :boolean

  def items
    children.published
  end
end
