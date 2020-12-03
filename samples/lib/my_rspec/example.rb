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

      @examples << block
    end

    def run(context)
      result = TestResult.new
      result.run_spec do
        @examples.each do |example|
          begin
            TestCase.new(context).instance_eval(&example)
            print "."
          rescue Matchers::UnmatchError => e
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
