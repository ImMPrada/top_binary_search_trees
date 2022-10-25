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
      in [nil, nil]
        :no_child
      in [nil, _]
        :one_child
      in [_, nil]
        :one_child
      in [_, _]
        :two_children
      end
    end

    def linked_to?(node)
      array_of_children.any?(node)
    end

    def to_h
      {
        data: @data,
        "left_child_for_#{@data}": @left_child&.to_hash,
        "right_child_for_#{@data}": @right_child&.to_hash
      }
    end

    private

    def array_of_children
      [@left_child, @right_child]
    end
  end
end
