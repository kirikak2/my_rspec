module MyRspec
  class ExpectedValue
    def initialize(expected_value = nil, &block)
      @expected_value = expected_value
      @block = block
    end

    def to(actual_value)
      unless @expected_value.nil?
        if(@block.call == actual_value)
        end
      else
        if(@expected_value == actual_value)
        end
      end
    end

    def not_to(actual_value)
      unless @expected_value.nil?
        if(@block.call != actual_value)
        end
      else
        if(@expected_value != actual_value)
        end
      end
    end
  end
end
