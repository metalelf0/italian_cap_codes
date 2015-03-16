class CreateItalianCapCodesComunes < ActiveRecord::Migration
  def change
    create_table :italian_cap_codes_comunes do |t|
      t.string  :post_code
      t.integer :province_id
      t.string  :fiscal_code
      t.string  :istat_code
      t.string  :name
      t.string  :phone_prefix

      t.timestamps null: false
    end
    add_index :italian_cap_codes_comunes, :province_id
  end
end
