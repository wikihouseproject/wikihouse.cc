class LibraryItem < PushType::Node
  has_child_nodes false

  include ImageNode

  after_create :refresh_repo

  delegate :description, to: :repo

  def repo
    @repo ||= Repo.find_or_create_by!(owner: "wikihouseproject", name: title)
  end

  private

  def refresh_repo
    Delayed::Job.enqueue RefreshRepoWorker.new(repo.id)
  end
end
