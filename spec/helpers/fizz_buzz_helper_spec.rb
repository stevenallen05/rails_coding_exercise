# frozen_string_literal: true

require 'rails_helper'

describe FizzBuzzHelper do
  describe 'FizzBuzz helper' do
    # FizzBuzz rules:
    # For any number evenly divisible by 3, return "Fizz"
    # For any number evenly divisible by 5, return "Buzz"
    # For any number evenly divisible by 3 and 5, return "FizzBuzz"
    # In all other cases, return the number

    it { expect(helper.generate_fizzbuzz(1)).to eq '1' }
    it { expect(helper.generate_fizzbuzz(2)).to eq '2' }
    it { expect(helper.generate_fizzbuzz(3)).to eq 'Fizz' }
    it { expect(helper.generate_fizzbuzz(5)).to eq 'Buzz' }
    it { expect(helper.generate_fizzbuzz(11)).to eq '11' }
    it { expect(helper.generate_fizzbuzz(15)).to eq 'FizzBuzz' }
  end
end
