class RenameProductsToTechnologies < ActiveRecord::Migration[5.0]
  def change
    rename_table :products, :technologies
  end
end
