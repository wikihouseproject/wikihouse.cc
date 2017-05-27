class LibraryItem < PushType::Node
  has_child_nodes false

  field :license_id, :select, choices: License.all.map { |l| [l.name, l.id] },
                              validates: { presence: true }

  include ImageNode

  validate do
    unless repo.exists?
      errors.add :title, "GitHub project '#{repo.full_name}' doesn't exist"
    end
  end

  after_create :refresh_repo

  delegate :description, to: :repo

  def repo
    @repo ||= Repo.get("wikihouseproject", title)
  end

  def license
    @license ||= License.find(license_id)
  end

  private

  def refresh_repo
    Delayed::Job.enqueue RefreshRepoWorker.new(repo.id)
  end
end
