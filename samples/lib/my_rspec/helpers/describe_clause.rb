module MyRspec
  module Helpers
    module DescribeClause
      def describe(name_or_constant, params = {}, &block)
        params[:parent] = self
        @examples << ExampleGroup.new(name_or_constant, params, &block)
      end
    end
  end
end
