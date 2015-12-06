module Georama
  class Parser

    def self.is_google_maps_url?(url)
      raise ArgumentError, "No url specified" if url.nil?
      parsed = URI.parse(url)
      is_google = parsed.host == "www.google.com"
      is_maps = parsed.path.start_with?("/maps/")
      is_google && is_maps
    end

    def self.url_type(path)
      raise ArgumentError, "No path specified" if path.nil?
      split_path = path.split("/")
      if split_path[2].start_with?("@")
        :general
      end
    end

    def self.get_coordinates(params)
      split_params = params.split(",")
      {}.tap do |res|
        res[:latitude]  = split_params[0].gsub("@", "").to_f
        res[:longitude] = split_params[1].to_f
      end
    end

    def self.get_metadata(params)
      split_params = params.split(",")
      {}.tap do |res|
        res[:zoom] = split_params[-1][/\d+\.?\d*+?(?=z)/].to_f
      end
    end

  end
end