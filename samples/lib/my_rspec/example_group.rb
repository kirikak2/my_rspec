module MyRspec
  class ExampleGroup
    include Helpers::DescribeClause
    include Helpers::ItClause
    include Helpers::LetClause
    include Helpers::ExpectClause
    include Helpers::SubjectClause
    include Helpers::Variable
    include Matchers

    def initialize(name_or_constant, params = {}, &block)
      @name = name_or_constant
      @params = params
      @examples = []
      @variables = {}

      @subject = 
        case name_or_constant
        when Class
          name_or_constant.new
        when String
          name_or_constant
        end

      instance_eval(&block)
    end

    def run(context = {})
      result = TestResult.new
      new_context = context.merge(parent: self, subject: @subject)
      @examples.each do |e|
        result.merge!(e.run(new_context))
      end
      result
    end
  end
end
