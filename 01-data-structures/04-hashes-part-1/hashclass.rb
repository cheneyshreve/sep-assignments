require_relative 'hash_item'
require 'prime'

class HashClass

  def initialize(size)
    @items = Array.new(size)

  end

# use summation, multiplication, and the modulus operator to create a hashing function
# create the insertion methods by overriding operators
  def []=(key, value)
    #need to work on this method and the next method
    @items[key] = value
  end

# create the insertion methods by overriding operators
  def [](key)
    @items[key]
  end

# when a collision occurs, expand the size of the existing code
# look to the next highest power of 2, then snag the closest prime number
# that prime number will become the new array size
  def resize
    current_size = @items.size
    next_power = (Math.log2(current_size)).ceil
    new_base = 2**next_power
    new_size = new_base

    until new_size.prime?
      new_size += 1
    end
    # now need to resize array to new size dims
    new_hash = Array.new(new_size)
    @items.each do |item|
      new_key = item.index(item,item.length)
      new_hash[key] = new_key
      new_hash[key] = item
    end
    @items = new_hash
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    # hash_code = key.chars.map{|x| x.ord }.join().to_i
    # key = hash_code
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
