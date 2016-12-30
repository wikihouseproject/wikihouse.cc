class DropDonations < ActiveRecord::Migration[5.0]
  def up
    drop_table :donations
  end

  def down
    create_table :donations do |t|
      t.string :display_name
      t.boolean :is_public
      t.integer :amount_in_cents
      t.string :frequency
      t.string :first_name
      t.string :last_name
      t.text :address
      t.string :city
      t.string :postcode
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
