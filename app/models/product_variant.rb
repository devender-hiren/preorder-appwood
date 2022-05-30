# == Schema Information
#
# Table name: product_variants
#
#  id                 :bigint           not null, primary key
#  name               :string           not null
#  handle             :string           not null
#  shopify_variant_id :bigint           not null
#  shopify_product_id :bigint           not null
#  image_url          :text             default([]), is an Array
#  price              :decimal(8, 2)
#  currency           :string
#  quantity           :integer
#  shop_id            :bigint
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class ProductVariant < ApplicationRecord
    belongs_to :shop
    has_many :collection_product_variants
    has_many :collections, :through => :collection_product_variants
    
    validates :name, :shopify_product_id, :shopify_variant_id, :price, presence: true
end
