require_relative 'node'

module Tree
  class BST
    LEFT_SIDE = :left
    RIGHT_SIDE = :right
    BASIC_ARR_SIZE_LIMITS = (1..3)

    attr_reader :root

    def initialize(arr)
      @sorted_arr = arr.sort.uniq
      @root = nil
    end

    def build_tree
      return if @sorted_arr.empty?

      @root = build_tree_helper(@sorted_arr)
    end

    def find_path_to(value)
      path_to_value_or_to_last_node = build_path(@root, value)

      return nil unless path_to_value_or_to_last_node.last

      path_to_value_or_to_last_node
    end

    def delete(value)
      path_to_value_or_to_last_node = build_path(@root, value)

      return unless path_to_value_or_to_last_node.last

      delete_node(path_to_value_or_to_last_node)
    end

    private

    def delete_node(path_to_node)
      case path_to_node.last.children_case
      when CASE_1
        delete_node_with_no_children(path_to_node)
      when CASE_2
        delete_node_with_one_child(path_to_node)
      end
    end

    def delete_node_with_no_children(path_to_node)
      current_node = path_to_node.last
      prev_node = path_to_node[-2]

      prev_node.left_child = nil if prev_node.left_child == current_node
      prev_node.right_child = nil if prev_node.right_child == current_node

      prev_node
    end

    def delete_node_with_one_child(path_to_node)
      current_node = path_to_node.last
      prev_node = path_to_node[-2]

      prev_node.left_child = current_node.left_child if prev_node.left_child == current_node
      prev_node.right_child = current_node.right_child if prev_node.right_child == current_node

      prev_node
    end

    def build_path(current_node, value)
      path_to_value = [current_node]

      until current_node.nil? || current_node.data == value
        current_node = value < current_node.data ? current_node.left_child : current_node.right_child
        path_to_value << current_node
      end

      path_to_value
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
