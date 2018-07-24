module RPNCalculator
  class Stack

    attr_reader :elements

    def initialize
      @elements = []
    end

    def compute(tokens)
    end

    def push(token)
      elements.push(token)
    end

    def pop(amount)
      elements.pop(amount)
    end

    def size
      elements.size
    end

    def clear
      elements.clear
    end
  end
end
