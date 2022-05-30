# frozen_string_literal: true

#
#  module for webhooks and jobs of shopify
#
module Shopify
  #
  # this job is triggered after shopify app is authenticated from frontend , update metadata of shop once authenticated
  #
  class AfterAuthenticateJob < ActiveJob::Base
    def perform(shop_domain:)
      shop = Shop.find_by(shopify_domain: shop_domain)
      unless shop.present?
        logger.error("#{self.class} failed: cannot find shop with domain '#{shop_domain}'")
        return
      end
      unless shop.metadata.present?
        shop.with_shopify_session do
          metadata = ShopifyAPI::Shop.current
          shop.update!({ metadata: metadata })
        end
      end

      # unless shop.products.present?
      #   shop.with_shopify_session do
      #     shopify_products = ShopifyAPI::Product.find(:all, params: { fields: %i[id handle images title] })
      #     shopify_products.each do |product|
      #       images_url = []
      #       product.images.each do |image|
      #         images_url.push(image.src)
      #       end
      #       shop.products.create!(shopify_product_id: product.id, handle: product.handle, title: product.title,
      #                             image_urls: images_url)
      #     end
      #   end
      # end
    end
  end
end
