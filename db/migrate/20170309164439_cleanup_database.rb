class CleanupDatabase < ActiveRecord::Migration[5.0]
  def change
    change_table :repos do |t|
      t.remove :scraped_at, :kind, :img, :sub_kind, :technology_id
    end

    drop_table :technologies
  end
end
