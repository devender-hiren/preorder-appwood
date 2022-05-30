# frozen_string_literal: true

#
# module for webhooks and jobs of shopify
#
module Shopify
  #
  # module for shopify webhooks
  #
  module Webhooks
    #
    # triggered when merchant  raises request to shopify for deleting shop data
    #
    class ShopRedactJob < ActiveJob::Base
      def perform(shop_domain:, webhook:)
        shop = Shop.find_by(shopify_domain: shop_domain)
        shop.destroy if shop.present?
      end
    end
  end
end
