class AddProductVariant < ActiveRecord::Migration[6.1]
  def change
    create_table :product_variants do |t|
      t.string :name, null: false
      t.string :handle, null: false
      t.bigint :shopify_variant_id, null: false
      t.bigint :shopify_product_id, null: false
      t.text :image_url, array: true, default: []
      t.decimal :price, precision: 8, scale: 2
      t.string :currency
      t.integer :quantity
      t.references :shop, index: true, foreign_key: true
      t.timestamps
    end
  end
end
