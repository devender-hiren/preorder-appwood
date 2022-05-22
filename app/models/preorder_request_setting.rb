# == Schema Information
#
# Table name: preorder_request_settings
#
#  id                     :bigint           not null, primary key
#  shop_id                :bigint
#  product_variant_id     :bigint
#  customer_id            :bigint
#  hide_buy_now_button    :boolean          default(FALSE)
#  button                 :json
#  message_above_button   :json
#  preorder_na_message    :json
#  preorder_limit_message :json
#
class PreorderRequestSetting < ApplicationRecord
end
