require 'spec_helper'

describe Georama::GeneralParser do
  describe :parse do
    it "raises an error when nil is passed in" do
      expect { Georama::GeneralParser.parse(nil) }.to raise_error ArgumentError, "Expected a valid url path got nil"
    end

    it "raises an error then an invalid url path is passed in" do
      expect { Georama::GeneralParser.parse("foobar") }.to raise_error ArgumentError, "Not a valid maps url path"
    end

    context "parsing a valid url" do
      let(:url) { "https://www.google.com/maps/@-33.9218305,18.4296954,15z?hl=en" }
      let(:result) { Georama::GeneralParser.parse(url) }

      it "extracts the coordinates" do
        expect(result[:coordinates][:latitude]).to eq(-33.9218305)
        expect(result[:coordinates][:longitude]).to eq(18.4296954)
      end

      it "extracts the zoom factor" do
        expect(result[:metadata][:zoom]).to eq(15)
      end
    end
  end
end