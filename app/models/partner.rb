class Partner < PushType::Node
  has_child_nodes false
  unexpose!

  field :link, :string

  include ImageNode

  def self.sorted
    order "sort_order"
  end
end
