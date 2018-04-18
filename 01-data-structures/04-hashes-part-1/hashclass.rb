require_relative 'hash_item'


class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

# override operators to (re)create hash function
  def []=(key, value)
    # create a new key,value pair
    item = HashItem.new(key, value)
    # create an index
    item_key = index(key, size)
    # check if the items array contains the index
    if @items[item_key].nil?
      @items[item_key] = item
    # check for possible collisions, if found, resize and update array
    elsif @items[item_key].key != item.key
      self.resize
      self[key] = value
    elsif @items[item_key].value != item.value
      self.resize
      @items[index(item.key, size)] = value
    end
  end

  def [](key)
     @items[index(key,@items.length)].value
  end

  def resize
    # remove any nil values using compact
    original_values = @items.compact
    # per the instructions, double the size for the new array
    @items = Array.new(self.size * 2)
    # iterate over each of the old values and update the keys and value
    original_values.each { |item| self[item.key] = item.value }
  end

  # generate an index
  def index(key, size)
    sum = 0
    key.chars.each do |x|
      sum += x.ord
    end
    sum % size
  end

  # return size
  def size
    @items.length
  end

  # print non-empty hash results
  def print
    n = @items.size
    n.times do |i|
      if @items[i] != nil
        puts "#{@items[i].key} : #{@items[i].value}"
      end
    end
  end

end
