module MyRspec
  class Example
    include Helpers::SubjectClause
    include Helpers::ItClause
    include Helpers::ExpectClause
    include Matchers


    def initialize(name, params = {}, &block)
      @name = name
      @params = params
      @block = block
      @examples = []

      @examples << block
    end

    def run(context)
      @examples.each do |example|
        example.call(context)
      end
    end
  end
end
