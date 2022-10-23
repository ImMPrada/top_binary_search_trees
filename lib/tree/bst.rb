require_relative 'node'

module Tree
  class BST
    LEFT_SIDE = :left
    RIGHT_SIDE = :right
    BASIC_ARR_SIZE_LIMITS = (2..3)

    attr_reader :root

    def initialize(arr)
      @sorted_arr = arr.sort.uniq
      @root = nil
    end

    def build_tree
      return if @sorted_arr.empty?

      @root = build_tree_helper(@sorted_arr)
    end

    def find(value)
      find_helper(@root, value)
    end

    private

    def find_helper(current_node, value)
      return if current_node.nil?

      return current_node if current_node.data == value

      return find_helper(current_node.left_child, value) if value < current_node.data

      find_helper(current_node.right_child, value)
    end

    def build_tree_helper(current_array)
      return build_basic_node(current_array) if BASIC_ARR_SIZE_LIMITS.include?(current_array.length)

      current_root = current_array[current_array.length / 2]

      Node.new(
        current_root,
        build_tree_helper(split_array(current_array, LEFT_SIDE)),
        build_tree_helper(split_array(current_array, RIGHT_SIDE))
      )
    end

    def build_basic_node(current_array)
      return Node.new(current_array[0], nil, Node.new(current_array[1])) if two_elements_array?(current_array)

      Node.new(current_array[1], Node.new(current_array[0]), Node.new(current_array[2]))
    end

    def two_elements_array?(current_array)
      current_array.length == 2
    end

    def split_array(current_array, side)
      spliter = current_array.length / 2

      return current_array[0..spliter - 1] if side == LEFT_SIDE
      return current_array[spliter + 1..] if side == RIGHT_SIDE
    end
  end
end
