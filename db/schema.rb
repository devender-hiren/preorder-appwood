# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_05_30_090359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badges", force: :cascade do |t|
    t.bigint "product_variant_id", null: false
    t.integer "badge_type"
    t.string "background_color", default: "black"
    t.json "text_settings", default: {"font_size"=>"14", "font_family"=>"sans-seriff", "font_color"=>"white"}
    t.string "text", default: "preorder"
    t.bigint "shop_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_badges_on_shop_id"
  end

  create_table "collection_product_variants", id: false, force: :cascade do |t|
    t.bigint "product_variant_id"
    t.bigint "collection_id"
    t.index ["collection_id"], name: "index_collection_product_variants_on_collection_id"
    t.index ["product_variant_id"], name: "index_collection_product_variants_on_product_variant_id"
  end

  create_table "collections", force: :cascade do |t|
    t.string "name", null: false
    t.string "collection_img_url"
    t.string "collection_color", null: false
    t.bigint "shop_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_collections_on_shop_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone"
    t.string "email", null: false
    t.bigint "customer_shopify_id", null: false
    t.bigint "shop_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_customers_on_shop_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "preorder_request_settings", force: :cascade do |t|
    t.bigint "shop_id"
    t.bigint "product_variant_id"
    t.bigint "customer_id"
    t.boolean "hide_buy_now_button", default: false
    t.json "button", default: {"text_color"=>"#FFFFFF", "hover_text_color"=>"#FFFFFF", "background_color"=>"#F35046", "hover_background_color"=>"#F35046", "border_color"=>"#F35046", "hover_border_color"=>"#F35046"}
    t.json "message_above_button", default: {"font_size"=>"14", "alignment"=>"left", "text_color"=>"#F35046", "background"=>"#FFFFFF"}
    t.json "preorder_na_message", default: {"text_color"=>"#606060", "background_color"=>"#FFFFFF", "border_color"=>"#3A3A3A"}
    t.json "preorder_limit_message", default: {"font_size"=>"14", "alignment"=>"left", "text_color"=>"#000", "background"=>"#fdf7e3", "border_color"=>"#eec200"}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_preorder_requests_on_shop_id"
  end

  create_table "product_variants", force: :cascade do |t|
    t.string "name", null: false
    t.string "handle", null: false
    t.bigint "shopify_variant_id", null: false
    t.bigint "shopify_product_id", null: false
    t.text "image_url", default: [], array: true
    t.decimal "price", precision: 8, scale: 2
    t.string "currency"
    t.integer "quantity"
    t.bigint "shop_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_product_variants_on_shop_id"
  end

  create_table "shop_settings", force: :cascade do |t|
    t.bigint "shop_id"
    t.json "welcome_steps", default: {}
    t.datetime "onboarded_at"
    t.json "subscribed_apps", default: {"oos"=>true, "preorder"=>true, "coming_soon"=>true, "price_drop"=>true}
    t.boolean "uninstalled", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_shop_settings_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "shopify_domain", null: false
    t.string "shopify_token", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "access_scopes"
    t.json "metadata"
    t.index ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true
  end

  add_foreign_key "badges", "shops"
  add_foreign_key "collections", "shops"
  add_foreign_key "customers", "shops"
  add_foreign_key "product_variants", "shops"
end
