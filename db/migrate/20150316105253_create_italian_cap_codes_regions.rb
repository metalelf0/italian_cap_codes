class CreateItalianCapCodesRegions < ActiveRecord::Migration
  def change
    create_table :italian_cap_codes_regions do |t|
      t.string :full_name
      t.string :short_name

      t.timestamps null: false
    end
  end
end
