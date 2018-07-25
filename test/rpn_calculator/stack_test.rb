require 'helper'

describe RPNCalculator::Stack do
  before do
    @stack = RPNCalculator::Stack.new()
  end

  describe "#initialize" do
    it "initializes the elements array" do
      RPNCalculator::Stack.new().elements.must_equal []
    end
  end

  describe "#compute" do
    it "clears the stack before calculating" do
      @stack.compute([1, 2, 3, :+, :+])
      @stack.compute([8, 3, :-])
      @stack.compute([10, 2, :/])

      @stack.elements.must_equal [5]
    end

    it "pushes a number" do
      @stack.elements.expects(:push).with(5)
      @stack.compute([5])
    end

    it "gracefully handles less than two tokens" do
      assert_raises RPNCalculator::Stack::NotEnoughTokensError do
        @stack.compute [:*]
      end
    end

    it "computes the result of the last two elements" do
      @stack.elements.stubs(:size).returns(3, 1)
      mock_elements = [6, 9]

      @stack.elements.expects(:pop).with(2).returns(mock_elements)
      @stack.elements.expects(:push).with(15)

      @stack.compute([:+])
    end

    it "gracefully handles an invalid stack size" do
      @stack.elements.stubs(:size).returns(2)

      assert_raises RPNCalculator::Stack::StackError do
        @stack.compute([:*])
      end
    end

    it "computes the result and returns the first element" do
      @stack.compute([9, 9, :+]).must_equal 18
    end

    it "computes fractional results" do
      @stack.compute([1, 4, :/]).must_equal 0.25
    end
  end
end
