require "my_rspec/version"

module MyRspec
  class Error < StandardError; end
  def self.describe(name_or_constant, params = {}, &block)
    ExampleGroup.new(name_or_constant, params, &block)
  end
end

require "my_rspec/helpers/describe_clause"
require "my_rspec/helpers/it_clause"
require "my_rspec/helpers/let_clause"
require "my_rspec/helpers/subject_clause"
require "my_rspec/helpers/expect_clause"
require "my_rspec/helpers/variable"
require "my_rspec/matchers"

require "my_rspec/actual_value"
require "my_rspec/example"
require "my_rspec/example_group"
require "my_rspec/test_case"
require "my_rspec/test_result"

RSpec = MyRspec
