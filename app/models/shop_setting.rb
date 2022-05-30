# == Schema Information
#
# Table name: shop_settings
#
#  id              :bigint           not null, primary key
#  shop_id         :bigint
#  welcome_steps   :json
#  onboarded_at    :datetime
#  subscribed_apps :json
#  uninstalled     :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class ShopSetting < ApplicationRecord
    belongs_to :shop
    validate :atleast_one_product_subscribed
    
    def atleast_one_product_subscribed
      if subscribed_apps.values.uniq == [false]
        errors.add(:subscribed_apps, 'At least one product should be subscribed')
      end
    end
end
