class AddCommitsCountToRepos < ActiveRecord::Migration[5.0]
  def change
    add_column :repos, :commits_count, :integer, default: 0
  end
end
