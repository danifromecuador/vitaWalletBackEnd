class CoinDeskService
  # Devuelve el precio actual del bitcoin en USD usando la API de CoinDesk
  def self.current_btc_price
    response = Faraday.get('https://api.coindesk.com/v1/bpi/currentprice.json')
    return nil unless response.success?

    data = JSON.parse(response.body)
    data['bpi']['USD']['rate_float']
  end
end
