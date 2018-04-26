require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

# insert a node
  def insert(root, node)
     if node.rating > root.rating
      if root.right.nil?
        root.right = node
      else
        insert(root.right, node)
      end
     else
       if root.left.nil?
         root.left = node
       else
         insert(root.left, node)
       end
     end
  end

  # Recursive Depth First Search
  def find(root, data)
    if root.nil? || data.nil?
      return nil
    else
      if root.title == data
        return root
      elsif root.left != nil
        find(root.left, data)
      elsif root.right != nil
        find(root.right, data)
      end
    end
  end

# removes node with given data, keeps binary search tree in tact
def delete(root, data)
  return nil if root.nil? || data.nil?
  node_to_remove = find(root,data)
    if node_to_remove
      node_to_remove.title = nil
      node_to_remove.rating = nil
    end
end

  # Recursive Breadth First Search
def printf(children=nil)
 results = []
 queue = [@root]
 return nil if @root.nil?
   while !queue.empty?
     next_node = queue.shift

     if next_node.title && next_node.rating
       results.push( "#{next_node.title}: #{next_node.rating}")
     end
     if !next_node.left.nil?
       queue << next_node.left
     end
     if !next_node.right.nil?
       queue << next_node.right
     end
   end
    results.each do |node|
        print node + "\n"
    end
end

end
