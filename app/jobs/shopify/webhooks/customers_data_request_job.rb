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
    # triggered when customer raises request to shopify for getting customers data
    #
    class CustomersDataRequestJob < ActiveJob::Base
      def perform(shop_domain:, webhook:)
        shop = Shop.find_by(shopify_domain: shop_domain)
        unless shop.present?
          logger.error("#{self.class} failed: cannot find shop with domain '#{shop_domain}'")
          return
        end
      end
    end
  end
end