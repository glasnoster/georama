require 'spec_helper'

describe Georama::Parser do

  describe :parse do

    it "raises an error when nil is passed in" do
      expect { Georama::Parser.parse(nil) }.to raise_error ArgumentError, "Expected a valid url got nil"
    end

    context "validating urls" do

      it "raises an error then an non-google url is passed in" do
        expect { Georama::Parser.parse("foobar") }.to raise_error ArgumentError, "Not a valid google maps url"
      end

    end

  end

end

