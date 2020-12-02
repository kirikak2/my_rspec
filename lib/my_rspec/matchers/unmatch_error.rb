module MyRspec
  module Matchers
    class UnmatchError < StandardError
      attr_reader :expected, :actual
      attr_accessor :source, :source_location
      def initialize(expected, actual, message = nil)
        @expected = expected
        @actual = actual
        super(message)
      end

      def print_result
        puts "Failure/Error: #{source}"
        print "  expected: "
        p expected
        print "       got: "
        p actual
        puts "\n  #{message}"
        puts source_location
      end
    end
  end
end
