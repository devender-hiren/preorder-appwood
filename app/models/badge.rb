# == Schema Information
#
# Table name: badges
#
#  id                 :bigint           not null, primary key
#  product_variant_id :bigint           not null
#  badge_type         :integer
#  background_color   :string           default("black")
#  text_settings      :json
#  text               :string           default("preorder")
#  shop_id            :bigint
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Badge < ApplicationRecord
end
