module MyRspec
  class ExampleGroup
    include Helpers::DescribeClause
    include Helpers::ItClause
    include Helpers::ExpectClause
    include Helpers::SubjectClause
    include Matchers

    def initialize(name_or_constant, params = {}, &block)
      @name = name_or_constant
      @params = params
      @examples = []
      @subject = nil
      @let_variables = {}

      instance_eval(&block)
    end

    def run(context = {})
      @examples.each do |e|
        e.run(context)
      end
    end
  end
end
