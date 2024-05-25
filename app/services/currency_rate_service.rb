class CurrencyRateService
  DEFAULT_CURRENCIES = %w[USD EUR UAH].freeze

  def self.call(user)
    base_currency = user.currency

    uri = URI.parse("https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5")
    response = Net::HTTP.get_response(uri)

    if response.code.to_i == 200
      rates = JSON.parse(response.body)

      rates_hash = rates.each_with_object({}) do |rate, hash|
        hash[rate["ccy"]] = { buy: rate["buy"].to_f, sale: rate["sale"].to_f }
      end

      if base_currency == "UAH"
        {
          "USD" => rates_hash["USD"][:sale],
          "EUR" => rates_hash["EUR"][:sale]
        }
      else
        rate = rates_hash[base_currency]
        { "UAH" => rate ? rate[:sale] : nil }
      end
    else
      nil
    end
  rescue SocketError
    nil
  end
end
