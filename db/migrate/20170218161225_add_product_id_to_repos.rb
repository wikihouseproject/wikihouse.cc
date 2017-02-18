class AddProductIdToRepos < ActiveRecord::Migration[5.0]
  def change
    add_reference :repos, :product, foreign_key: true
  end
end
