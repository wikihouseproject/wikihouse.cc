class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :ordinal, default: 0, index: true
      t.string :icon
      t.string :color

      t.timestamps
    end
  end
end
