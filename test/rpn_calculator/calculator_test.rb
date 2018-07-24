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

  describe "#calculate" do
    it "calculates" do
      @calculator.stack.stubs(:compute)
      @calculator.parser.expects(:parse).with "2 2 +"

      @calculator.calculate "2 2 +"
    end

    it "updates the stack" do
      @calculator.parser.stubs(:parse).returns ["3", "4", "+"]
      @calculator.stack.expects(:compute).with ["3", "4", "+"]

      @calculator.calculate "3 4 +"
    end
  end
end
