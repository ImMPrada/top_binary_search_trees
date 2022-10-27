require_relative 'node'
require_relative 'fake_queue'
require_relative 'fake_stack'
require 'byebug'

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

    def find(value)
      return if @root.nil?

      path_to_value = find_path_to(value)
      return unless path_to_value

      path_to_value.last
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

    def insert(value)
      return unless @root
      return unless find_path_to(value).nil?

      insert_node(@root, value)
    end

    # tree.level_order do |node|
    #   puts(
    #     "#{node.object_id} data: #{node.data}\n
    #      ++ L--> #{node.left_child ? node.left_child.object_id : 'NO'}\n
    #       ++++ data: #{node.left_child ? node.left_child.data : '*'}\n
    #      ++ R--> #{node.right_child ? node.right_child.object_id : 'NO'}\n
    #       ++++ data: #{node.right_child ? node.right_child.data : '*'}\n"
    #   )
    # end

    def level_order
      return if @root.nil?

      queue = FakeQueue.new(@root)
      level_order = []

      until queue.empty?
        current_node = queue.remove

        level_order << current_node
        queue.add(current_node.left_child) if current_node.left_child
        queue.add(current_node.right_child) if current_node.right_child
        yield(current_node) if block_given?
      end

      return level_order unless block_given?
    end

    # tree.preorder { |node| puts "#{node.object_id} data: #{node.data}\n" }
    # <root><left><right>
    def preorder
      return if @root.nil?

      response = []
      stack = FakeStack.new(@root.right_child)
      current_node = @root

      until stack.empty?
        response << current_node

        stack.add(current_node.right_child) if current_node.right_child
        yield(current_node) if block_given?

        current_node = response.last.left_child || stack.pop
      end

      response unless block_given?
    end

    # <left><root><right>
    def inorder
      return if @root.nil?

      response = []
      current_node = @root
      stack = FakeStack.new(current_node)
      go_trough_left_side = true

      until stack.empty?
        if current_node.left_child.nil? || !go_trough_left_side

          response << current_node
          yield(current_node) if block_given?

          if current_node.right_child
            go_trough_left_side = true
            current_node = current_node.right_child
          else
            go_trough_left_side = false
            current_node = stack.pop
          end
        elsif go_trough_left_side
          stack.add(current_node)
          current_node = current_node.left_child
        end
      end

      response unless block_given?
    end

    # <left><right><root>
    def postorder
      return if @root.nil?

      response = []
      current_node = @root
      stack = FakeStack.new
      go_trough = LEFT_SIDE
      stop = false
      visits_to_root = 0

      until stop
        visits_to_root += 1 if stack.empty?
        stop = true if visits_to_root == 3

        if go_trough == LEFT_SIDE
          if current_node.left_child
            stack.add(current_node)
            current_node = current_node.left_child

            next
          else
            go_trough = RIGHT_SIDE
          end
        end

        if go_trough == RIGHT_SIDE
          if current_node.right_child
            if current_node.right_child == response.last
              response << current_node
              yield(current_node) if block_given?

              current_node = stack.pop
              go_trough = RIGHT_SIDE
            else
              stack.add(current_node)
              current_node = current_node.right_child
              go_trough = LEFT_SIDE
            end

            next
          else
            response << current_node
            yield(current_node) if block_given?

            current_node = stack.pop
          end
        end
      end

      response unless block_given?
    end

    def to_h
      @root&.to_h
    end

    private

    def insert_node(node, value)
      return node.left_child = Node.new(value) if value < node.data && node.left_child.nil?
      return node.right_child = Node.new(value) if value > node.data && node.right_child.nil?

      insert_node(value < node.data ? node.left_child : node.right_child, value)
    end

    def delete_node(path_to_node)
      case path_to_node.last.children_case
      when CASE_1
        delete_node_with_no_children(path_to_node)
      when CASE_2
        delete_node_with_one_child(path_to_node)
      when CASE_3
        delete_node_with_two_children(path_to_node)
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

    def delete_node_with_two_children(path_to_node)
      current_node = path_to_node.last
      prev_node = path_to_node[-2]

      rebuild_prev_node(current_node, prev_node, find_deep_min_node(current_node))
    end

    def find_deep_min_node(current_node)
      path_to_deep_min = find_deep_min_path_from(current_node.right_child)
      deep_min_node = path_to_deep_min.last

      path_to_deep_min[-2].left_child = deep_min_node.right_child if path_to_deep_min.length > 1

      deep_min_node.right_child = current_node.right_child if deep_min_node != current_node.right_child
      deep_min_node.left_child = current_node.left_child

      deep_min_node
    end

    def rebuild_prev_node(current_node, prev_node, deep_min_node)
      prev_node.left_child = deep_min_node if prev_node.left_child == current_node
      prev_node.right_child = deep_min_node if prev_node.right_child == current_node

      prev_node
    end

    def find_deep_min_path_from(node)
      path_til_node = []

      until node.nil?
        path_til_node << node
        node = node.left_child
      end

      path_til_node
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

      current_root_value = current_array[calculate_spliter(current_array)]

      Node.new(
        current_root_value,
        build_tree_helper(split_array(current_array, LEFT_SIDE)),
        build_tree_helper(split_array(current_array, RIGHT_SIDE))
      )
    end

    def build_basic_node(current_array)
      return Node.new(current_array[0]) if one_element_array?(current_array)
      return Node.new(current_array[1], Node.new(current_array[0], nil)) if two_elements_array?(current_array)

      Node.new(current_array[1], Node.new(current_array[0]), Node.new(current_array[2]))
    end

    def one_element_array?(current_array)
      current_array.length == 1
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
