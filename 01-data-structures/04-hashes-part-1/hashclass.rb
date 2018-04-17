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
    if @items[index(key,@items.length)]!= nil
     @items[index(key,@items.length)].value
    end
  end

  def resize
    original_array = @items
    doubled_array = Array.new(original_array.length * 2)
    original_array.each do |item|
      if item != nil
        doubled_array[index(item.key, item.to_s.size)] = item
      end
    end
    @items = doubled_array
  end

  def index(key, size)
    key.sum % size
  end

  def size
    @items.length
  end

  def print

  end

end
