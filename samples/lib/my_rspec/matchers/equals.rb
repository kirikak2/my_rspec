require 'my_rspec/matchers/unmatch_error'

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
          if expected != actual.value
            raise UnmatchError.new(expected, actual.value, "(compared using ==)")
          end
        end

        def !=(actual)
          if expected == actual.value
            raise UnmatchError.new(expected, actual.value, "(compared using !=)")
          end
        end
      end
    end
  end
end

