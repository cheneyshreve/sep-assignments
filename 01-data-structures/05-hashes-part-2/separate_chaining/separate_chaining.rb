require_relative 'linked_list'
require_relative 'node'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
    @entries = 0
  end

  def []=(key, value)
    i = self.index(key, size)
    if @items[i] == nil
      @items[i] = LinkedList.new
    end
    @items[i].add_to_tail(Node.new(key,value))
    @entries += 1
    if load_factor > @max_load_factor
      self.resize
    end
  end

  def [](key)
    i = self.index(key,size)
    if @items[i]
      current = @items[i].head
      while current != nil
        if current.key == key
          return current.value
        else
          current = current.next
        end
      end
    end
  end

  def index(key, size)
    sum = 0
    key.chars.each do |x|
      sum += x.ord
    end
    sum % size
  end

  # Calculate the current load factor
  def load_factor
    @entries / self.size.to_f
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    new_items = Array.new(self.size * 2)

    (0..@items.size-1).each do |i|
      list = @items[i]
      if list != nil
        curr = list.head
        new_index = index(curr.key, new_items.size)
        while curr != nil
          list = LinkedList.new
          list.add_to_tail(curr)
          new_items[new_index] = list
          curr = curr.next
        end
      end
    end
    @items = new_items
  end
end
