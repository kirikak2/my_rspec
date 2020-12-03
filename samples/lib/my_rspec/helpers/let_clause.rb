module MyRspec
  module Helpers
    module LetClause
      def let(name = nil, params = {}, &block)
        @variables[name] = block
      end
    end
  end
end
