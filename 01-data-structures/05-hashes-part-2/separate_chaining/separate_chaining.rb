require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @lists = Array.new(size)
  end

  def []=(key, value)
   # create a new node, assign an index
    node = Node.new(key,value)
    i = index(key, self.size)
    # check conditions, list empty?
    if @lists[i].nil?
      # create a new linked list
      list = Linked.new(key, self.size)
      list.add_to_tail(node)
      @lists[i] = list
    # check if list is at capacity yet, if not add_to_tail
    elsif @lists[i].size < 5
      @lists[i].add_to_tail(node)
    # resize if the max_load_factor is exceeded
    else
      if self.load_factor > max_load_factor
        resize
      end
    end


  end

  def [](key)
    # generate an index
    i = index(key,self.size)
    # check conditions
    if @lists[i] != nil
      node = @lists[i].find_node(key)
      return node.value unless node.value.nil?
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

  # Calculate the current load factor
  def load_factor
    # number of array elements in hash table / number of buckets allocated
    count = 0.0
    @lists.each do |x|
     if @lists[x] != nil
       count += @lists[x].size
     end
    end
    (count/self.size)
  end

  # Simple method to return the number of items in the hash
  def size
    @lists.length
  end

  # Resize the hash
  def resize
    original_values = @lists.compact
    @lists = Array.new(self.size * 2)
    original_values.each {|node| self[node.key] = node.value }
  end
end
