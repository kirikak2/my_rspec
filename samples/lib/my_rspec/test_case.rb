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
  end
end
