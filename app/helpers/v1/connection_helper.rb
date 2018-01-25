require 'net/http'
require 'uri'

module V1::ConnectionHelper

    def validate_token(token, url = Rails.configuration.AUTH_API_IDENTITY_URL)
        uri = URI(url)
        http = Net::HTTP.new(uri.host, uri.port)

        begin
            response = http.post(uri.path, nil, get_headers(token))
            process_response(response)
        rescue StandardError
            return nil, "500"
        end
    end

    def process_response(response)
      case response
      when Net::HTTPSuccess
        return JSON.parse(response.body)['user']['id'],response.code
      else
        return nil, response.code
      end
    end

    def get_headers(token)
        {
            'Authorization' => "Bearer #{token}",
            'Content-Type' => 'application/json',
            'Accept' => 'application/json'
        }
    end

end
