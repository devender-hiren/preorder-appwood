class AddJoinTableForCollectionAndProductVariant < ActiveRecord::Migration[6.1]
  def change
    create_table :collection_product_variants, id: false do |t|
      t.belongs_to :product_variant, index: true
      t.belongs_to :collection, index: true
    end
  end
end
