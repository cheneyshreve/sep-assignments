require_relative 'node'

class OpenAddressing

  def initialize(size)
    @items = Array.new(size)
    @size = size
    @entries = 0
    @max_load_factor = 0.7
  end

  def []=(key, value)
    # compute the hash code for key, assign to index
    node = Node.new(key,value)
    i = index(key,self.size)
    item = @items[i]
    if @items[i] == nil
      @items[i] = node
      @entries += 1
    elsif @items[i].key == key && @items[i].value != value
      @items[i].value = value
    else
      j = self.next_open_index(i)
      if j == -1
        resize
        self[key] = value
      else
        @items[j] = Node.new(key,value)
        @entries += 1
        if load_factor > @max_load_factor
          self.resize
        end
      end
    end
  end

  def [](key)
    (0..@items.size-1).each do |i|
      if @items[i] != nil
        if @item[i].key == key
          return @items[i].value
        end
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0
    key.chars.each do |x|
      sum += x.ord
    end
    sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    i = index
    for i in index..self.size - 1 do
      if @items[i] == nil
        return i
      end
    end
    return -1
  end

  # Simple method to return the number of items in the hash
  def size
   @items.length
  end

  def load_factor
    @entries / self.size.to_f
  end


  # Resize the hash
  def resize
    old_items = @items.compact
    @items = Array.new(self.size * 2)
    old_items.each { |item| self[item.key] = item.value }
  end
end
