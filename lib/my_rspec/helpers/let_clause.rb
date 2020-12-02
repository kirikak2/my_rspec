module MyRspec
  module Helpers
    module LetClause
      def let(name = nil, params = {}, &block)
        @let_variables[name] = block
      end

      def let_variables(name)
        @let_variables[name].call
      end
    end
  end
end
