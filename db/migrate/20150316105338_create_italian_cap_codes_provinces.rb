class CreateItalianCapCodesProvinces < ActiveRecord::Migration
  def change
    create_table :italian_cap_codes_provinces do |t|
      t.string :full_name
      t.string :short_name
      t.integer :region_id

      t.timestamps null: false
    end
    add_index :italian_cap_codes_provinces, :region_id
  end
end
