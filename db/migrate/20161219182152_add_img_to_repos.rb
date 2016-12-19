class AddImgToRepos < ActiveRecord::Migration[5.0]
  def change
    add_column :repos, :img, :text
  end
end
