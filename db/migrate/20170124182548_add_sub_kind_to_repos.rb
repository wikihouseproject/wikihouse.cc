class AddSubKindToRepos < ActiveRecord::Migration[5.0]
  def change
    add_column :repos, :sub_kind, :string
  end
end
