module Georama
  class GeneralParser

    def self.parse(url)
      raise ArgumentError, "Expected a valid url path got nil" if url.nil?
      url_path = URI.parse(url).path
      split = url_path.split("/")
      raise ArgumentError, "Not a valid maps url path" if split.length < 3 || !split[2].start_with?("@")
      {}.tap do |res|
        res[:coordinates] = get_coordinates(split[2])
      end
    end

    def self.get_coordinates(params)
      split_params = params.split(",")
      {}.tap do |res|
        res[:latitude]  = split_params[0].gsub("@", "").to_f
        res[:longitude] = split_params[1].to_f
      end
    end

  end
end
