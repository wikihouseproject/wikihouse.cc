class DropProposals < ActiveRecord::Migration[5.0]
  def up
    drop_table :proposals
  end
  def down
    create_table :proposals do |t|
      t.string :name
      t.jsonb :data

      t.timestamps
    end
  end
end
