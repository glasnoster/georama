module Georama
  class GeneralParser

    def self.parse(url)
      raise ArgumentError, "Expected a valid url path got nil" if url.nil?
      url_path = URI.parse(url).path
      split = url_path.split("/")
      raise ArgumentError, "Not a valid maps url path" if split.length < 3 || !split[2].start_with?("@")
      result = {}
      result[:coordinates] = get_coordinates(split[2])
      result
    end

    def self.get_coordinates(params)
      split_params = params.split(",")
      result = {}
      result[:latitude] = split_params[0].gsub("@", "").to_f
      result[:longitude] = split_params[1].to_f
      result
    end

  end
end
