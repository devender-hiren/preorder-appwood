# == Schema Information
#
# Table name: collection_product_variants
#
#  product_variant_id :bigint
#  collection_id      :bigint
#
class CollectionProductVariant < ApplicationRecord
    belongs_to :product_variant
    belongs_to :collection
end
