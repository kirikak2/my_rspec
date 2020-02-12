module MyRspec
  module Helpers
    module ItClause
      def it(name = nil, params = {}, &block)
        @examples << Example.new(name, params, &block)
      end
    end
  end
end
