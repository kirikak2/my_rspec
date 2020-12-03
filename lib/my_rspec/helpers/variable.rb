module MyRspec
  module Helpers
    module Variable
      def find_variable(name)
        @variables[name].call
      end
    end
  end
end
