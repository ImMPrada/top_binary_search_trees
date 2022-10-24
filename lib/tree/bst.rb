require_relative 'node'
require_relative 'fake_queue'

module Tree
  class BST
    LEFT_SIDE = :left
    RIGHT_SIDE = :right
    BASIC_ARR_SIZE_LIMITS = (1..3)

    attr_reader :root

    def initialize(arr)
      @sorted_arr = arr.sort.uniq
      @root = nil
      @path = FakeQueue.new
    end

    def build_tree
      return if @sorted_arr.empty?

      @root = build_tree_helper(@sorted_arr)
    end

    def find_path_to(value)
      path_to_value_or_to_last_node = build_path(@root, value)

      return nil unless path_to_value_or_to_last_node.last.data == value

      path_to_value_or_to_last_node.last
    end

    private

    def build_path(current_node, value)
      path_to_value = [current_node]

      until current_node.nil? || current_node.data == value
        current_node = value < current_node.data ? current_node.left_child : current_node.right_child
        path_to_value << current_node
      end
    end

    def build_tree_helper(current_array)
      return build_basic_node(current_array) if BASIC_ARR_SIZE_LIMITS.include?(current_array.length)

      current_root = current_array[calculate_spliter(current_array)]

      Node.new(
        current_root,
        build_tree_helper(split_array(current_array, LEFT_SIDE)),
        build_tree_helper(split_array(current_array, RIGHT_SIDE))
      )
    end

    def build_basic_node(current_array)
      return Node.new(current_array[0]) if one_element_array?(current_array)
      return Node.new(current_array[0], nil, Node.new(current_array[1])) if two_elements_array?(current_array)

      Node.new(current_array[1], Node.new(current_array[0]), Node.new(current_array[2]))
    end

    def one_element_array?(current_array)
      current_array.length == 3
    end

    def two_elements_array?(current_array)
      current_array.length == 2
    end

    def split_array(current_array, side)
      spliter = calculate_spliter(current_array)

      return current_array[0..spliter - 1] if side == LEFT_SIDE
      return current_array[spliter + 1..] if side == RIGHT_SIDE
    end

    def calculate_spliter(current_array)
      (current_array.length - 1) / 2
    end
  end
end
