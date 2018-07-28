module RPNCalculator
  class Stack
    class NotEnoughTokensError < StandardError; end;
    class StackError < StandardError; end;

    attr_reader :elements

    def initialize
      @elements = []
    end

    def compute(tokens)
      self.elements.clear

      tokens.each do |token|
        if token.is_a? Numeric
          self.elements.push(token)
          next
        end

        if self.elements.size < 2
          raise NotEnoughTokensError.new(
            "Not enough tokens, plese enter at least two values."
          )
        end

        result = self.elements.pop(2).reduce do |accumulator, element|
          accumulator.send(token, element.to_f)
        end

        self.elements.push(result)
      end

      self.elements.first
    end
  end
end
