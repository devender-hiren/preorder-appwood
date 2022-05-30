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
    # triggered when conversion falcon app uninstalls in shopify
    #
    class AppUninstalledJob < ActiveJob::Base
      def perform(shop_domain:, webhook:)
        shop = Shop.find_by(shopify_domain: shop_domain)
        Rails.logger.info "Webhook: app/ uninstalled #{shop_domain} #{webhook[:id]}"
        return unless shop

        shop.social_app_setting.update(onboarded_at: nil, uninstalled: true)
      end
    end
  end
end
