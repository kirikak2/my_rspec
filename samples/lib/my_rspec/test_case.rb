module MyRspec
  class TestCase
    include Helpers::ExpectClause
    include Matchers

    def initialize(context)
      @context = context
    end

    def subject
      @context[:subject] && @context[:subject].call
    end

    def method_missing(name, *args)
      @context[:parent].let_variables(name)
    end
  end
end
