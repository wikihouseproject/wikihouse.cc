class LibraryItem < PushType::Node
  has_child_nodes false

  include ImageNode

  delegate :description, to: :repo

  def repo
    @repo ||= Repo.find_or_initialize_by(owner: "wikihouseproject", name: title)
  end
end
