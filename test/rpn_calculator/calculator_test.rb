require 'helper'

describe RPNCalculator::Calculator do
  before do
    @calculator = RPNCalculator::Calculator.new
  end

  describe "#initialize" do
    it "creates a stack" do
      @calculator.stack.wont_be_nil
    end
  end

  describe "#calculate" do
    it "calculates" do
      @calculator.stack.stubs(:compute)
      @calculator.expects(:parse).with "2 2 +"

      @calculator.calculate "2 2 +"
    end

    it "updates the stack" do
      @calculator.stubs(:parse).returns ["3", "4", "+"]
      @calculator.stack.expects(:compute).with ["3", "4", "+"]

      @calculator.calculate "3 4 +"
    end
  end

  describe "#parse" do
    it "handles numeric values" do
      @calculator.parse("5 -1 17 20").must_equal [5, -1, 17, 20]
    end

    it "handles fractional values" do
      @calculator.parse("5.2 -1.1 18.21").must_equal [5.2, -1.1, 18.21]
    end

    it "handles operators" do
      @calculator.parse(". / * + -").must_equal [:'.', :/, :*, :+, :-]
    end

    it "gracefully handles invalid operators" do
      assert_raises RPNCalculator::Calculator::InvalidOperatorError do
        @calculator.parse("4 3 ^ &")
      end
    end

    it "returns an array of all the parsed values" do
      @calculator.parse("-3 -2 * 5 +").must_equal [-3, -2, :*, 5, :+]
    end
  end
end
