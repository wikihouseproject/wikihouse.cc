class PartnersPage < PushType::Node
  has_child_nodes :partner
  unexpose!
end
