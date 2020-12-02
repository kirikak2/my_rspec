module MyRspec
  module Helpers
    module ExpectClause
      def expect(actual_value, &block)
        ActualValue.new(actual_value, &block)
      end
    end
  end
end
