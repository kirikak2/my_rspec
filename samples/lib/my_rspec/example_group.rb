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
      @let_variables = {}

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
      context.merge(parent: self, subject: @subject)
      @examples.each do |e|
        e.run(context)
      end
    end
  end
end