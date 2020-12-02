require 'my_rspec/matchers/equals'

module MyRspec
  module Matchers
    def self.included(mod)
      mod.include Equals
    end
  end
end
