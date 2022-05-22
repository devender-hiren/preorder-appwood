class AddCustomer < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :phone
      t.string :email, null: false
      t.bigint :customer_shopify_id , null: false
      t.references :shop, index: true, foreign_key: true
      t.timestamps
    end
  end
end
