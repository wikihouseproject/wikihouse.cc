class CreateEnquiries < ActiveRecord::Migration[5.0]
  def change
    create_table :enquiries do |t|
      t.jsonb :data
      t.string :ip

      t.timestamps
    end
  end
end
