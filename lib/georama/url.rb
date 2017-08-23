module Georama

  class Url

    def initialize(url)
      raise ArgumentError, "Expected a valid maps url, got nil" if url.nil?
      raise ArgumentError, "Not a valid url" unless Georama::Parser.is_valid_url?(url)
      raise ArgumentError, "Not a valid maps url" unless Georama::Parser.is_google_maps_url?(url)
      @url_string = url
      @parsed_url = URI.parse(url)
    end

    def type
      @type ||= Georama::Parser.url_type(@parsed_url.path)
    end

    def coordinates
      @coordinates ||= Georama::Parser.get_coordinates(coordinates_component)
    end

    def latitude
      coordinates[:latitude]
    end

    def longitude
      coordinates[:longitude]
    end

    def metadata
      @metadata ||= Georama::Parser.get_metadata(coordinates_component)
    end

    def zoom
      metadata[:zoom]
    end

    def place
      return nil unless type == :place
      @place ||= URI.unescape(path_components[2].gsub("+", " "))
    end

    private

    def coordinates_component
      @coordinates_component ||= case type
      when :general
        path_components[1]
      when :place
        path_components[3]
      end
    end

    def path_components
      @path_components ||= @parsed_url.path.split("/")[1..-1]
    end

  end

end