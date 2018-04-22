
class MinHeap
  attr_reader :element

  def initialize
    @elements = [nil]
    @elements_position_map = Hash.new
  end

  def <<(element)
    @elements << element
    @elements_position_map[element.node] = @elements.size - 1
    bubble_up(@elements.size - 1)
  end


  def pop
    exchange(1, @elements.size - 1)
    max = @elements.pop
    bubble_down(1)
    max
  end

  def bubble_up(index)
    parent_index = (index / 2)

    return if index <= 1

    return if @elements[parent_index].rating <= @elements[index].rating

    exchange(index, parent_index)
    bubble_up(parent_index)
  end

  def bubble_down(index)
    child_index = (index * 2)

    return if child_index > @elements.size - 1

    not_the_last_element = child_index < @elements.size - 1
    left_element = @elements[child_index]
    right_element = @elements[child_index + 1]
    child_index += 1 if not_the_last_element && right_element.rating > left_element.rating

    return if @elements[index].rating >= @elements[child_index].rating

    exchange(index, child_index)
    bubble_down(child_index)
  end

  def exchange(source_index, target_index)
    tmp_source = @elements[source_index]
    tmp_target = @elements[target_index]

    source_element_position = @elements_position_map[tmp_source.node]
    target_element_position = @elements_position_map[tmp_target.node]

    @elements[source_index] = tmp_target
    @elements[target_index] = tmp_source

    @elements_position_map[tmp_source.node] = target_element_position
    @elements_position_map[tmp_target.node] = source_element_position
  end

  def printf(children=nil)
    values = @elements.compact

    while !values.empty?
      current = values.shift
      puts "#{current.title} : #{current.rating}"
    end

  end

end

root = Node.new("The Matrix", 87)
tree = MinHeap.new
n1 = Node.new("Pacific Rim", 72)
n2 = Node.new("Braveheart", 78)
n3 = Node.new("Donnie Darko", 85)
n4 = Node.new("Inception", 86)
n5 = Node.new("District 9", 90)
n6 = Node.new("The Martian", 92)
n7 = Node.new("Star Wars: A New Hope", 93)
n8 = Node.new("Mad Max 2: The Road Warrior", 98)
tree << root
tree << n1
tree << n2
tree << n3
tree << n4
tree << n5
tree << n6
tree << n7
tree << n8

tree.printf
