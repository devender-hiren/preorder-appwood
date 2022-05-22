class AddCollection < ActiveRecord::Migration[6.1]
  def change
    create_table :collections do |t|
      t.string :name, null: false
      t.string :collection_img_url
      t.string :collection_color , null: false
      t.references :shop, index: true, foreign_key: true
      t.timestamps
    end
  end
end
