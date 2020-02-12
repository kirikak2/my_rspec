module MyRspec
  module Matchers
    def self.included(mod)
      mod.include EqualsMatcher
    end
  end
end
require 'my_rspec/matchers/equals_matcher'
