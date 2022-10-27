require_relative 'tree'

module Tree
  class FakeStack
    attr_reader :data

    def initialize(first_data = nil)
      @data = first_data ? [first_data] : []
    end

    def add(value)
      @data << value
    end

    def pop
      return nil if @data.empty?

      @data.pop
    end

    def empty?
      @data.empty?
    end

    def size
      @data.size
    end

    def to_s
      "stack: #{@data}"
    end
  end
end
