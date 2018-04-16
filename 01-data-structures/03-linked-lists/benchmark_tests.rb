require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

# Compare the time it takes to create a 10,000 item Array to appending 10,000 items to a Linked List.
n = 10000
array = []
linked_list = LinkedList.new

Benchmark.bm(10) do |x|
 x.report('Add item to array:') do
  for i in 1..n do
    array[i] = i
  end
 end

 x.report('Add item to list:') do
  for i in 1..n do
    node = Node.new(i)
    linked_list.add_to_tail(node)
  end
 end
end


Benchmark.bm(10) do |x|
 x.report('Access 5000th element in array:') do
   target = array[4999]
 end

 x.report("find tail of linked list") do
   target = linked_list.tail
 end
end

Benchmark.bm(10) do |pop|
  pop.report("remove an element from the array") do
    array.pop(4999)
  end
  pop.report("remove an element from the linked list") do
    linked_list.delete(4999)
  end
end
