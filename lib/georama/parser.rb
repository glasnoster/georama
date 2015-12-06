module Georama
  class Parser

    def self.parse(url)
      raise ArgumentError, "Expected a valid url got nil" if url.nil?
      parsed = URI.parse(url)
      raise ArgumentError, "Not a valid google maps url" unless is_google_maps_url? parsed
      case url_type(parsed.path)
      when :general
        Georama::GeneralParser.parse(parsed.path)
      end
    end

    def self.is_google_maps_url?(parsed_url)
      is_google = parsed_url.host == "www.google.com"
      is_maps = parsed_url.path.start_with?("/maps/")
      is_google && is_maps
    end

    private

    def self.url_type(url_path)
      split = url_path.split("/")
      if split[2].start_with?("@")
        :general
      end
    end
  end
end