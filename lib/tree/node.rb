module Tree
  class Node
    attr_reader :data
    attr_accessor :left_child, :right_child

    def initialize(data, left_child = nil, right_child = nil)
      @data = data
      @left_child = left_child
      @right_child = right_child
    end
  end
end
