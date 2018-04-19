require_relative 'node'

class OpenAddressing

  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    i = index(key, @size)
    item = @items[i]
    if item.nil?
      @items[i] = Node.new(key, value)
    elsif item.key != key
      while @items[index(key, @size)].key != nil && @items[index(key, @size)].key != key
        resize
        new_index = index(key, @size)
        break if @items[new_index] == nil
      end
      self[key] = value
    elsif item.key == key && item.value != value
      if next_open_index(i) == -1
        resize
        new_index = index(key, @size)
        @items[new_index].value = value
      else
        next_index = next_open_index(index(key, @size))
        @items[next_index] = value
      end
    end
  end

  def [](key)
    item = @items[index(key, @size)]
    if item == nil
      return nil
    else
      return item.value
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  def index(key, size)
    sum = 0
    key.chars.each do |x|
      sum += x.ord
    end
    key.sum % size
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

  # Resize the hash  # Resize the hash
  def resize
    @size = @size * 2
    expanded_hash = Array.new(@size)
    @items.each do |item|
      if item != nil
        expanded_hash[index(item.key, @size)] = item
      end
    end
    @items = expanded_hash
  end

  def print
    n = @items.size
    n.times do |i|
      if @items[i] != nil
        puts "#{@items[i].key} : #{@items[i].value}"
      end
    end
  end
end
