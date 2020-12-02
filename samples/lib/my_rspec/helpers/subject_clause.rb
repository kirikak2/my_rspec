module MyRspec
  module Helpers
    module SubjectClause
      def subject(name = nil, &block)
        @subject = block
      end
    end
  end
end
