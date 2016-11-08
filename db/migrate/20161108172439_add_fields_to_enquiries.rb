class AddFieldsToEnquiries < ActiveRecord::Migration[5.0]
  def change
    add_column :enquiries, :first_name, :string
    add_column :enquiries, :last_name, :string
    add_column :enquiries, :email, :string
    add_column :enquiries, :kind, :string
  end
end
