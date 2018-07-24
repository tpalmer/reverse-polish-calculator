module RPNCalculator
  class Calculator
    attr_reader :parser, :stack

    def initialize
      @stack = Stack.new()
      @parser = Parser.new()
    end

    def calculate(command)
      stack.compute parser.parse(command)
    end
  end
end
