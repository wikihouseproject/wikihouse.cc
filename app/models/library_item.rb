class LibraryItem < PushType::Node
  has_child_nodes false

  field :license_id, :select, choices: License.all.map { |l| [l.name, l.id] },
                              validates: { presence: true }

  include ImageNode

  after_create :refresh_repo

  delegate :description, to: :repo

  def repo
    @repo ||= Repo.find_or_create_by!(owner: "wikihouseproject", name: title)
  end

  def license
    @license ||= License.find(license_id)
  end

  private

  def refresh_repo
    Delayed::Job.enqueue RefreshRepoWorker.new(repo.id)
  end
end
