require 'parser/current'

module MyRspec
  class SpecParser
    attr_reader :parsed_list

    def initialize(spec_source)
      @source_sexp = Parser::CurrentRuby.parse(spec_source)
      @root_node = @source_sexp.children.detect{|node| node.type == :block && describe_clause?(node) }
      @parsed_list = []
    end

    def search_node(current_node = @root_node)
      current_node.children.each do |node|
        if node.instance_of?(Parser::AST::Node)
          case node.type
          when :begin
            search_node(node)
          when :block
            if describe_clause?(node)
              search_node(node.children[2])
            elsif it_clause?(node)
              parsed_list << node
            end
          end
        end
      end
    end

    private
    def describe_clause?(node)
      node.children[0]&.type == :send && node.children[0].children[1] == :describe
    end

    def it_clause?(node)
      node.children[0]&.type == :send && node.children[0].children[1] == :it
    end

    def subject_clause?(node)
      node.children[0]&.type == :send && node.children[0].children[1] == :subject
    end

    def expect_clause?(node)
      node.children[0]&.type == :send && node.children[0].children[1] == :expect
    end

    def let_clause?(node)
      node.children[0]&.type == :send && node.children[0].children[1] == :let
    end
  end
end

