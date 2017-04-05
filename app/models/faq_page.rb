class FaqPage < PushType::Node
  has_child_nodes :faq_item

  def items
    children.published
  end
end
