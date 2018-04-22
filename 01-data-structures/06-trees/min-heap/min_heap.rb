require_relative 'node'

class MinHeap
  attr_reader :element

  def initialize
    @elements = [nil]
    @elements_position_map = Hash.new
  end

  # override shovel operator
  def <<(element)
    @elements << element
  end

  def elements
    return @elements.drop(1) # make sure nil element is removed
  end

 # inserts a node
  def insert(node)
    @elements << node
    @elements_position_map[node.rating] = @elements.size - 1
    bubble_up(@elements.size - 1)
  end

 # removes last node, organizes heap again
  def pop
    exchange(1, @elements.size - 1)
    max = @elements.pop
    bubble_down(1)
    max
  end

# organizes heap
  def bubble_up(index)
    parent_index = (index / 2)

    return if index <= 1

    return if @elements[parent_index].rating >= @elements[index].rating

    exchange(index, parent_index)
    bubble_up(parent_index)
  end

# organizes heap
  def bubble_down(index)
    child_index = (index * 2)

    return if child_index > @elements.size - 1

    not_the_last_element = child_index < @elements.size - 1
    left_child = @elements[child_index]
    right_child = @elements[child_index + 1]

    if not_the_last_element && right_child.rating < left_child.rating
      child_index += 1
    end

    return if @elements[index].rating <= @elements[child_index].rating

    exchange(index, child_index)
    bubble_down(child_index)
  end

# swaps two nodes
  def exchange(source_index, target_index)
    tmp_source = @elements[source_index]
    tmp_target = @elements[target_index]

    source_element_position = @elements_position_map[tmp_source.rating]
    target_element_position = @elements_position_map[tmp_target.rating]

    @elements[source_index] = tmp_target
    @elements[target_index] = tmp_source

    @elements_position_map[tmp_source.rating] = target_element_position
    @elements_position_map[tmp_target.rating] = source_element_position
  end

# finds and returns a node
  def find(node,data)
    temp = self.elements

    while !temp.empty?
      current = temp.shift
        if current = data
          return current
        else
          return nil
        end
    end
  end

# removes a node
  def delete(node,data)
    node = find(node,data)
    return nil if node.nil?
      element_position = @elements_position_map[node.rating]

    unless element_position.nil?
      exchange(element_position, @elements.size - 1)
      element_to_remove = @elements.pop
      @elements_position_map.delete(element_to_remove.rating)

      bubble_down(element_position)
      return element_to_remove
    end
  end


  def printf(children=nil)
    values = self.elements

    while !values.empty?
      current = values.shift
      puts "#{current.title}: #{current.rating}"
    end
  end


end
