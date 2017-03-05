class HomePage < PushType::Node
  has_child_nodes :slider, :press_article

  include SliderHost

  def press_articles
    children.published.where(type: "PressArticle")
  end
end
