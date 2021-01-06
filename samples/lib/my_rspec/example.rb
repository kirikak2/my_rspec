module MyRspec
  class Example
    include Helpers::SubjectClause
    include Helpers::ItClause
    include Helpers::LetClause
    include Helpers::Variable

    def initialize(name, params = {}, &block)
      @name = name
      @params = params
      @block = block
      @examples = []
      @example_sexp = []

      @examples << block
    end

    def annotate_sexp(parsed_list)
      @example_sexp = parsed_list.shift(@examples.length)
    end

    def run(context)
      result = TestResult.new
      result.run_spec do
        @examples.each.with_index do |example, index|
          begin
            TestCase.new(context).instance_eval(&example)
            print "."
          rescue Matchers::UnmatchError => e
            e.source = @example_sexp[index].loc.expression.source
            result.failed!(e)
            print "F"
          rescue => e
            result.failed!(e)
            print "F"
          end
        end
      end
      result
    end
  end
end
