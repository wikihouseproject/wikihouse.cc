class RenameProductIdOnReposToTechnologyId < ActiveRecord::Migration[5.0]
  def change
    rename_column :repos, :product_id, :technology_id
  end
end
