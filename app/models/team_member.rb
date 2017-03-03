class TeamMember < PushType::Node
  has_child_nodes false
  unexpose!

  field :role,     :string, validates: { presence: true }
  field :photo_id, :asset,  validates: { presence: true }

  field :twitter_handle, :string

  def name
    title
  end

  def photo_url
    photo.media(:team_photo).url
  end

  def twitter_url
    "https://twitter.com/#{twitter_handle}"
  end
end
