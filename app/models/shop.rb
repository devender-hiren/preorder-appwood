# frozen_string_literal: true

# == Schema Information
#
# Table name: shops
#
#  id             :bigint           not null, primary key
#  shopify_domain :string           not null
#  shopify_token  :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  access_scopes  :string
#  metadata       :json
#
class Shop < ActiveRecord::Base
  include ShopifyApp::ShopSessionStorageWithScopes

  has_one :shop_setting, dependent: :destroy
  has_many :collections, dependent: :destroy
  has_many :product_variants, dependent: :destroy
  has_many :customers, dependent: :destroy
  has_one :preorder_request_setting, dependent: :destroy

  after_create :create_shop_settings

  def api_version
    ShopifyApp.configuration.api_version
  end

  protected

  def create_shop_settings
    shop_setting = build_shop_setting
    shop_setting.save!
  end
end
