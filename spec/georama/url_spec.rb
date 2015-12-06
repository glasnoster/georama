require 'spec_helper'

describe Georama::Url do

  let(:valid_general_url) { "https://www.google.com/maps/@-33.9218305,18.4296954,15z?hl=en" }
  let(:valid_place_url) { "https://www.google.com/maps/place/Cape+Town/@-33.9218305,18.4296954,15z/data=foobar" }

  describe :initialize do

    context "with an invalid url" do
      let(:url) { "foo" }

      it "raises an error" do
        expect { Georama::Url.new(url) }.to raise_error ArgumentError, "Not a valid maps url"
      end
    end

    context "with a nil url" do
      it "raises an error" do
        expect { Georama::Url.new(nil) }.to raise_error ArgumentError, "Expected a valid maps url, got nil"
      end
    end

    context "with a valid url" do
      it "does not raise an error" do
        expect { Georama::Url.new(valid_general_url) }.to_not raise_error
      end
    end

  end

  describe :type do
    let(:result) { Georama::Url.new(url) }

    context "with a general url" do
      let(:url) { valid_general_url }
      it "returns the correct type" do
        expect(result.type).to eq(:general)
      end
    end

    context "with a place url" do
      let(:url) { valid_place_url }
      it "returns the correct type" do
        expect(result.type).to eq(:place)
      end
    end
  end

  describe :coordinates do
    let(:expected_coordinates) do
      {
        latitude: -33.9218305,
        longitude: 18.4296954
      }
    end
    let(:result) { Georama::Url.new(url) }

    context "with a general url" do
      let(:url) { valid_general_url }

      it "extracts the coordinates" do
        expect(result.coordinates).to eq(expected_coordinates)
      end

      context "accessing the coordinates individually" do
        it "it returns the correct latitude" do
          expect(result.latitude).to eq(-33.9218305)
        end

        it "it returns the correct longitude" do
          expect(result.longitude).to eq(18.4296954)
        end
      end
    end

    context "with a place url" do
      let(:url) { valid_place_url }

      it "extracts the coordinates" do
        expect(result.coordinates).to eq(expected_coordinates)
      end
    end

  end

  describe :metadata do
    let(:result) { Georama::Url.new(url) }
    context "with a general url" do
      let(:url) { valid_general_url }
      it "extracts the zoom" do
        expect(result.metadata[:zoom]).to eq(15)
      end

      context "accessing the metadata components individually" do
        it "returns the zoom" do
          expect(result.zoom).to eq(15)
        end
      end
    end

    context "with a place url" do
      let(:url) { valid_place_url }
      it "extracts the zoom" do
        expect(result.metadata[:zoom]).to eq(15)
      end
    end

  end

  describe :place do
    let(:result) { Georama::Url.new(url) }
    context "with a general url" do
      let(:url) { valid_general_url }

      it "returns nil" do
        expect(result.place).to be_nil
      end
    end

    context "with a place url" do
      let(:url) { valid_place_url }

      it "returns the correct place" do
        expect(result.place).to eq("Cape Town")
      end
    end
  end

end
