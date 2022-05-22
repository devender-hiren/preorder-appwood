class AddShopSetting < ActiveRecord::Migration[6.1]
  def change
    create_table "shop_settings" do |t|
      t.bigint "shop_id"
      t.json "welcome_steps", default: {}
      t.datetime "onboarded_at"
      t.json "subscribed_apps", default: {"oos_preorder": true,"oos": true,"preorder": true, "coming_soon": true , "price_drop": true}
      t.boolean "uninstalled", default: false
      t.index ["shop_id"], name: "index_shop_settings_on_shop_id"
    end
  end
end
