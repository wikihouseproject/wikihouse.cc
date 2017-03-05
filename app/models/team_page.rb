class TeamPage < PushType::Node
  has_child_nodes :team_member

  def team_members
    children.published.where(type: "TeamMember").shuffle
  end
end
