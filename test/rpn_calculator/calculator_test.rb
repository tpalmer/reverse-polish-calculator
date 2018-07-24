require 'helper'

describe RPNCalculator::Calculator do
  before do
    @calculator = RPNCalculator::Calculator.new
  end

  describe "#initialize" do
    it "creates a stack" do
      @calculator.stack.wont_be_nil
    end

    it "creates a parser" do
      @calculator.parser.wont_be_nil
    end
  end
end
