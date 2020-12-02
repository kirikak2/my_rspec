module MyRspec
  class TestResult
    attr_accessor :total_examples, :failed_examples, :failures

    def initialize
      self.total_examples = 0
      self.failed_examples = 0
      self.failures = []
    end

    def merge!(result)
      self.total_examples += result.total_examples
      self.failed_examples += result.failed_examples
      self.failures.concat(result.failures)
    end

    def run_spec
      yield
      self.total_examples += 1
    end

    def failed!(error)
      self.failed_examples += 1
      self.failures << error 
    end

    def print_result
      failures.each do |failure|
        failure.print_result
      end
      puts "#{total_examples} example, #{failed_examples} failures"
    end
  end
end
