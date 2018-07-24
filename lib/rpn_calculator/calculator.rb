module RPNCalculator
  class Calculator
    attr_reader :parser, :stack

    def initialize
      @stack = Stack.new()
      @parser = Parser.new()
    end
  end
end
