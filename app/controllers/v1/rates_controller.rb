class V1::RatesController < ApplicationController
  def rate
    @rate = CoinDeskService.current_btc_price
    render json: @rate
  end
end
