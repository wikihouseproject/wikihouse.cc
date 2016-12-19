class AddKindToRepos < ActiveRecord::Migration[5.0]
  def change
    add_column :repos, :kind, :string
  end
end
