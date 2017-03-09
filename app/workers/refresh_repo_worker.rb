class RefreshRepoWorker
  attr_reader :id

  def initialize(id)
    @id = id
  end

  def perform
    Repo.find(id).refresh
  end
end
