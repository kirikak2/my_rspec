module MyRspec
  module Matchers
    module Equals
      def eq(except_value)
        EqualsValue.new(expect_value)
      end

      class EqualsValue
        def initialize(expected)
          @expected = expected
        end

        def ==(actual)
          raise if self.expected == actual.value
        end

        def !=(actual)
          raise if self.expected != actual.value
        end
      end
    end
  end
end

