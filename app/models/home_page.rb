class HomePage < PushType::Node
  has_child_nodes :slider
  unexpose!
  include SliderHost
end
