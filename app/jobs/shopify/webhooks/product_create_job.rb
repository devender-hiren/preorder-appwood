# frozen_string_literal: true

#
# module for webhooks and jobs of shopify
#
module Shopify
  #
  # module for shopify webhooks
  #
  module Webhooks
    class ProductCreateJob < ActiveJob::Base
      def perform(shop_domain:, webhook:)
        shop = Shop.find_by(shopify_domain: shop_domain)

        if shop.nil?
          logger.error("#{self.class} failed: cannot find shop with domain '#{shop_domain}'")
          return
        end

        product = shop.products.find_or_create_by!(shopify_product_id: webhook[:id], title: webhook[:title],
                                                   handle: webhook[:handle])

        images_array = []
        if webhook[:images].present?
          webhook[:images].each do |image|
            images_array.push(image[:src])
          end
        end
        product.update!(image_urls: images_array)
      end
    end
  end
end
