module MyRspec
  class Example
    include Helpers::SubjectClause
    include Helpers::ItClause
    include Helpers::ExpectClause
    include Matchers


    def initialize(name, params, &block)
      @name = name
      @params = params
      @block = block
      @examples = []

      instance_eval(&block)
    end

    def run(context)
      @block.call(context)
    end
  end
end
