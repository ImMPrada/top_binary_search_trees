require_relative 'tree'

module Tree
  class Node
    attr_reader :data
    attr_accessor :left_child, :right_child

    def initialize(data, left_child = nil, right_child = nil)
      @data = data
      @left_child = left_child
      @right_child = right_child
    end

    def children_case
      case array_of_children
      when [nil, nil]
        :no_child
      when [nil, _], [_, nil]
        :one_child
      when [_, _]
        :two_children
      end
    end

    private

    def array_of_children
      [@left_child, @right_child]
    end
  end
end
