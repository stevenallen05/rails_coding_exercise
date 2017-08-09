require "rails_helper"

describe FibonacciHelper do
  describe "Fibonacci sequence helper" do
    it { expect(helper.generate(0)).to eq 0 }
    it { expect(helper.generate(1)).to eq 1 }
    it { expect(helper.generate(10)).to eq 55 }
    it { expect(helper.generate(20)).to eq 6_765 }
    ### This one may be slow...
    # it { expect(helper.generate(50)).to eq 12_586_269_025 }
    
    let(:first_10_fibonacci_numbers) { [1, 1, 2, 3, 5, 8, 13, 21, 34, 55] }
    
    it { expect(helper.generate_array(10)).to eq first_10_fibonacci_numbers }
    
  end
end
