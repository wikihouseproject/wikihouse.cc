class CreateAboutPoints < ActiveRecord::Migration[5.0]
  def change
    create_table :about_points do |t|
      t.integer :ordinal, default: 0, index: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
