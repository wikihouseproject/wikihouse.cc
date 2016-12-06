class CreateRepos < ActiveRecord::Migration[5.0]
  def change
    create_table :repos do |t|
      t.string :name
      t.string :owner
      t.jsonb :data
      t.datetime :scraped_at

      t.timestamps
    end
  end
end
