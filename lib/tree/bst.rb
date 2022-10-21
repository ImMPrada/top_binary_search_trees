module Tree
  class BST
    attr_reader :root

    def initialize(arr)
      @sorted_arr = arr.sort.uniq
      @root = nil
    end
  end
end
