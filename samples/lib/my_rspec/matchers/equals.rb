module MyRspec
  module Matchers
    module Equals
      def eq(expect_value)
        EqualsValue.new(expect_value)
      end

      class EqualsValue
        attr_reader :expected
        def initialize(expected)
          @expected = expected
        end

        def ==(actual)
          raise if expected != actual.value
        end

        def !=(actual)
          raise if expected == actual.value
        end
      end
    end
  end
end

