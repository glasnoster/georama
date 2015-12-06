require 'uri'

class Georama

  def self.parse(url)
    raise ArgumentError, "Expected a valid url got nil" if url.nil?
    parsed = URI.parse(url)
    raise ArgumentError, "Not a valid google maps url" unless is_google_maps_url? parsed
  end

  def self.is_google_maps_url?(parsed_url)
    is_google = parsed_url.host == "www.google.com"
    is_maps = parsed_url.path.start_with?("/maps/")
    is_google && is_maps
  end

end