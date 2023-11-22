require 'net/http'
require 'json'

class MovieService
  BASE_URL = ENV["BASE_URL"]
  API_KEY = ENV["MOVIELIST_API_KEY"]

  def self.get_movies_list(options={})
    url = "#{BASE_URL}?apikey=#{API_KEY}"
    url += "&s=latest" unless options.present?
    url += "&plot=full&i=#{options[:id]}" if options[:id].present?
    uri = URI(url)
    response = Net::HTTP.get_response(uri)
    if response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body)
    else
      nil
    end
  end
end