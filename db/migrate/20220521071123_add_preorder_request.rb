class AddPreorderRequest < ActiveRecord::Migration[6.1]
  def change
    create_table "preorder_request_settings" do |t|
      t.bigint "shop_id"
      t.bigint "product_variant_id"
      t.bigint "customer_id"
      t.boolean "hide_buy_now_button", default: false
      t.json "button", default: { "text_color": "#FFFFFF", "hover_text_color": "#FFFFFF","background_color": "#F35046", "hover_background_color": "#F35046","border_color": "#F35046", "hover_border_color": "#F35046"
      }
      t.json "message_above_button", default: {
        "font_size": "14",
        "alignment": "left",
        "text_color": "#F35046",
        "background": "#FFFFFF"
      }
      t.json "preorder_na_message", default:{
        "text_color": "#606060",
        "background_color": "#FFFFFF",
        "border_color": "#3A3A3A"
      }
      t.json "preorder_limit_message", default: {
        "font_size": "14",
        "alignment": "left",
        "text_color": "#000",
        "background": "#fdf7e3",
        "border_color": "#eec200"
      }
      t.index ["shop_id"], name: "index_preorder_requests_on_shop_id"
      t.timestamps
    end

  end
end
