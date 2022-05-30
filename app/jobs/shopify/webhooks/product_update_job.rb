# frozen_string_literal: true

#
# module for webhooks and jobs of shopify
#
module Shopify
  #
  # module for shopify webhooks
  #
  module Webhooks
    class ProductUpdateJob < ActiveJob::Base
      def perform(shop_domain:, webhook:)
        shop = Shop.find_by(shopify_domain: shop_domain)

        if shop.nil?
          logger.error("#{self.class} failed: cannot find shop with domain '#{shop_domain}'")
          return
        end

        product = shop.product_variants.find_by(shopify_product_id: webhook[:id])
        if product.present?
          product.update!(name: webhook[:title], handle: webhook[:handle])
        else
          product = shop.product_variants.create!(shopify_product_id: webhook[:id], name: webhook[:title],
                                          handle: webhook[:handle])
        end
        images_array = []
        if webhook[:images].present?
          webhook[:images].each do |image|
            images_array.push(image[:src])
          end
        end
        product.update!(image_url: images_array)
      end
    end
  end
end
