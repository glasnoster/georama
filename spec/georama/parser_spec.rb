require 'spec_helper'

describe Georama::Parser do

  let(:general_url) { "https://www.google.com/maps/@-33.9218305,18.4296954,15z?hl=en" }

  describe :url_type do

    context "with an no path" do
      it "raises an error" do
        expect { Georama::Parser.url_type(nil) }.to raise_error ArgumentError, "No path specified"
      end
    end

    context "with a general maps path" do
      let(:path) { "/maps/@-33.9218305,18.4296954,15z?hl=en" }
      it "returns the correct type" do
        expect(Georama::Parser.url_type(path)).to eq(:general)
      end
    end

    context "with a place path" do
      let(:path) { "/maps/place/Cape+Town/@-33.9092719,18.8965703,8.13z/data=foobar" }
      it "returns the correct type" do
        expect(Georama::Parser.url_type(path)).to eq(:place)
      end
    end

  end

  describe :is_google_maps_url? do
    context "with no url" do
      it "raises an error" do
        expect { Georama::Parser.is_google_maps_url?(nil) }.to raise_error ArgumentError, "No url specified"
      end
    end

    context "with an invalid url" do
      it "returns false" do
        expect(Georama::Parser.is_google_maps_url?("http://www.fake.com/foo/bar")).to be_falsey
      end
    end

    context "with a valid url" do
      it "returns true" do
        expect(Georama::Parser.is_google_maps_url?(general_url)).to be_truthy
      end
    end
  end

  describe :get_coordinates do
    context "with a valid coordinates component" do
      let(:coordinates_component) { "@-33.9218305,18.4296954,15z?hl=en" }
      let(:expected_coordinates) do
        {
          latitude: -33.9218305,
          longitude: 18.4296954
        }
      end

      it "returns a coordinates hash" do
        expect(Georama::Parser.get_coordinates(coordinates_component)).to eq(expected_coordinates)
      end
    end
  end

  describe :metadata do
    context "with a valid coordinates component" do
      let(:coordinates_component) { "@-33.9218305,18.4296954,15z?hl=en" }
      let(:expected_zoom) { 15 }

      it "returns the correct zoom" do
        expect(Georama::Parser.get_metadata(coordinates_component)[:zoom]).to eq(expected_zoom)
      end
    end
  end

end

