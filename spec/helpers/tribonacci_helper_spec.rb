# frozen_string_literal: true

require 'rails_helper'

describe TribonacciHelper do
  describe 'Tribonacci sequence helper' do
    let(:first_10_tribonacci_numbers) { [0, 1, 1, 2, 4, 7, 13, 24, 44, 81] }

    it { expect(helper.generate_tribonacci_array(10)).to eq first_10_tribonacci_numbers }
    it { expect(helper.generate_tribonacci_array(1)).to eq [0] }
    it { expect(helper.generate_tribonacci_array(2)).to eq [0, 1] }
    it { expect(helper.generate_tribonacci_array(3)).to eq [0, 1, 1] }
  end

  describe 'Tribonacci sequence helper with starting sequence 3, 1, 3' do
    let(:first_10_tribonacci_numbers) { [3, 1, 3, 7, 11, 21, 39, 71, 131, 241] }

    it { expect(helper.generate_tribonacci_array(10, [3, 1, 3])).to eq first_10_tribonacci_numbers }
    it { expect(helper.generate_tribonacci_array(1, [3, 1, 3] )).to eq [3] }
    it { expect(helper.generate_tribonacci_array(2, [3, 1, 3])).to eq [3, 1] }
    it { expect(helper.generate_tribonacci_array(3, [3, 1, 3])).to eq [3, 1, 3] }
  end
end
