require 'benchmark'
require_relative 'binary_tree/binary_search_tree'
require_relative 'min-heap/min_heap'


root = Node.new("binary_search", 10)
tree = BinarySearchTree.new(root)


heap_root = Node.new("heap_search", 10)
heap_tree = MinHeap.new
heap_tree.insert(heap_root)

n = 10000

Benchmark.bm(100) do |x|
 x.report("binary tree #insert") do
   for i in 1..n do
     node = Node.new("binary node", Random.rand(100000))
     tree.insert(root, node)
   end
 end
 x.report("min heap #insert") do
    for i in 1..n do
       node = Node.new("min node", Random.rand(100000))
       heap_tree.insert(node)
    end
  end
end

element = Node.new("element", 50000)
tree.insert(root, element)
heap_tree.insert(element)

Benchmark.bm(100) do |x|
 x.report("binary search #find") do
  tree.find(root, element)
 end

 x.report("min heap #find") do
   heap_tree.find(heap_root, element)
 end
end


Benchmark.bm(100) do |x|
  x.report("binary search #delete") do
    tree.delete(root, element)
  end

  x.report("min heap #delete") do
    heap_tree.delete(heap_root, element)
  end
end
