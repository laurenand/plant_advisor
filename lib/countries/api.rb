require 'pry'

class API 
     
  def self.valid_country?(capital_city)
    url = "https://restcountries.eu/rest/v2/capital/#{capital_city}"
    response = HTTParty.get(url, follow_redirects: true) # sends request for data to url
    if response.ok?
        response
    end
  end
#binding.pry
  def self.get_country_by_capital_cities(capital_city)
    response = self.valid_country?(capital_city)
    if response
        response.map do |hash|
            country_data = {}
            country_data[:name] = hash["name"],
            country_data[:region] = hash["region"],
            country_data[:population] = hash["population"],
            country_data[:capital] = hash["capital"],
            # country_data[:borders] = hash["borders"],
            # country_data[:languages] = hash["languages"],
            country_data[:flag_link] = hash["flag"]
            country_data
        end
    end
  end
end