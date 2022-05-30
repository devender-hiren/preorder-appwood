# == Schema Information
#
# Table name: collections
#
#  id                 :bigint           not null, primary key
#  name               :string           not null
#  collection_img_url :string
#  collection_color   :string           not null
#  shop_id            :bigint
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Collection < ApplicationRecord
    belongs_to :shop
    has_many :collection_product_variants
    has_many :product_variants, :through => :collection_product_variants

    validates :name, presence: true
end
