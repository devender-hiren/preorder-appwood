class AddBadge < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.bigint :product_variant_id, null: false
      t.integer :badge_type
      t.string :background_color, default: "black"
      t.json :text_settings, default: {"font_size": "14", "font_family": "sans-seriff", "font_color": "white"}
      t.string :text, default: "preorder"
      t.references :shop, index: true, foreign_key: true

      t.timestamps
    end
  end
end
