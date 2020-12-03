module MyRspec
  module Helpers
    module SubjectClause
      def subject(name = nil, &block)
        @subject = block
        if name
          @variables[name] = block
        end
      end
    end
  end
end
