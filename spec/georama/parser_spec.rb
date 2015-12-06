require 'spec_helper'

describe Georama::Parser do

  describe :parse do

    it "raises an error when nil is passed in" do
      expect { Georama::Parser.parse(nil) }.to raise_error ArgumentError, "Expected a valid url got nil"
    end

    it "raises an error then an non-google url is passed in" do
      expect { Georama::Parser.parse("foobar") }.to raise_error ArgumentError, "Not a valid google maps url"
    end

    context "parsing" do

      context "general urls" do
        let(:url) { "https://www.google.com/maps/@-33.9218305,18.4296954,15z?hl=en" }
        let(:result) { Georama::Parser.parse(url) }

        it "does not raise an error" do
          expect { Georama::Parser.parse(url) }.to_not raise_error
        end

        it "delegates to the general parser" do
          expect(Georama::GeneralParser).to receive(:parse)
          Georama::Parser.parse(url)
        end

      end

    end

  end

end

