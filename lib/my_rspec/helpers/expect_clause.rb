module MyRspec
  module Helpers
    module ExpectClause
      def expect(expected_value, &block)
        ExpectedValue.new(expected_value, &block)
      end
    end
  end
end
