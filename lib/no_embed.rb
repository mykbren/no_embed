require 'net/http'
require 'uri'
require 'json'

module NoEmbed
  API_ENDPOINT = 'https://noembed.com/embed'

  class << self
    def get_embed_for_url(url, **params)
      raise ArgumentError, 'URL is required' if url.nil? || url.empty?

      uri = URI(API_ENDPOINT)
      uri.query = URI.encode_www_form({ url: url }.merge(params))

      response = Net::HTTP.get_response(uri)
      parse_response(response)
    end

    private

    def parse_response(response)
      case response
      when Net::HTTPSuccess
        JSON.parse(response.body)
      else
        raise StandardError, "NoEmbed API Error: #{response.message}"
      end
    end
  end
end
