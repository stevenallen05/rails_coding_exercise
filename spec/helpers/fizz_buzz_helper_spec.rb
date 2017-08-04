require "rails_helper"

describe FizzBuzzHelper do
  describe "FizzBuzz helper" do
    it { expect(helper.generate(1)).to eq "1" }
    it { expect(helper.generate(2)).to eq "2" }
    it { expect(helper.generate(3)).to eq "Fizz" }
    it { expect(helper.generate(5)).to eq "Buzz" }
    it { expect(helper.generate(11)).to eq "11" }
    it { expect(helper.generate(15)).to eq "FizzBuzz" }
  end
end
