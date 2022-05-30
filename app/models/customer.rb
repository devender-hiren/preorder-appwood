# == Schema Information
#
# Table name: customers
#
#  id                  :bigint           not null, primary key
#  name                :string           not null
#  phone               :string
#  email               :string           not null
#  customer_shopify_id :bigint           not null
#  shop_id             :bigint
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class Customer < ApplicationRecord
    belongs_to :shop
  
    validates :email, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
