require 'helper'

describe "example input/output" do
  before do
    @calculator = RPNCalculator::Calculator.new
  end

  it "handles the first example" do
    @calculator.calculate("5 8 +").must_equal 13
  end

  it "handles the second example" do
    @calculator.calculate("5 8 + 13 -").must_equal 0
  end

  it "handles the third example" do
    @calculator.calculate("-3 -2 * 5 +").must_equal 11
  end

  it "handles the fourth example" do
    @calculator.calculate("5 9 1 - /").must_equal 0.625
  end
end
