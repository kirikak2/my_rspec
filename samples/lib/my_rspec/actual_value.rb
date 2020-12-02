module MyRspec
  class ActualValue
    attr_reader :value

    def initialize(actual_value = nil, &block)
      @value = actual_value
      @block = block
    end

    def to(expected)
      expected == self
    end

    def not_to(expected)
      expected != self
    end
  end
end
