class HomePage < PushType::Node
  has_child_nodes :slider

  include SliderHost
end
