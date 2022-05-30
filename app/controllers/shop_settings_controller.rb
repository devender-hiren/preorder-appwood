class ShopSettingsController < ApplicationController
  before_action :set_shop
  before_action :get_shop_settings
  def update
    respond_to do |format|
      if @shop_setting.update(update_shop_settings_params)
        @shop_setting.update_shop_metafields
        format.json { render json: @shop_setting, status: :ok }
      else
        format.json { render json: @shop_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def get_shop_settings
    @shop_setting = @shop.shop_setting
  end

  def update_shop_settings_params
    params.permit( { subscribed_apps: [ :price_drop, :coming_soon, :preorder, :oos  ] } , { welcome_steps: [ :step1, :step2, :step3, :step4  ] } )
  end
end
