module RPNCalculator
  class Calculator
    class InvalidOperatorError < StandardError; end;

    attr_reader :stack

    OPERATORS = %w{. + - * /}

    def initialize
      @stack = Stack.new()
    end

    def calculate(command)
      stack.compute self.parse(command)
    end

    def parse(command)
      command.split().map do |element|
        if (Float(element) rescue false)
          if element =~ /\./
            element.to_f
          else
            element.to_i
          end
        else
          if OPERATORS.include?(element)
            element.to_sym
          else
            raise InvalidOperatorError.new("Invalid operator: #{element}")
          end
        end
      end
    end
  end
end
