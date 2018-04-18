require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail


  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    # set head to temporary variable, current
    current = @head
    # if list is empty [], add the node
    if (@head == nil) && (@tail == nil)
      @head = node
      @tail = node
      @head.next = nil
    else
    # we have something like this [head|tail] -> [head|tail] -> [head|nil]
    # iterate over the list until you come to the end, e.g. pointer equals nil
    while current.next != nil
      current = current.next
    end
    # now that we have the last node [head|nil], assign it to the input node
      current.head = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    # iterate over list until you find tail, e.g. head.next = nil
    current = @head
    until current.next == nil
      current.next
    end
    # set the new tail to be the current node, define new "end"
    @tail = current
    @tail.next = nil
  end

  # This method prints out a representation of the list.
  def print
    # if we have no list, return an empty string
    current = @head
    return "" if @head == nil
    # traverse the nodes, print the values
    until current.next == nil
      current = current.next
      puts current.data
    end

  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
   current = @head
   # if node is empty, return nil, invalid request
   return nil if current == nil
   # check if current node is the only node [head|tail]
   if (@head == @tail)
     @head = nil
     @tail = nil
   elsif (@head == node)
     # if the current head is node, set the new head to next position
     @head = @head.next
  # if node is tail, remove the tail
   elsif (@tail == node)
     remove_tail
    # otherwise, traverse nodes, [head|tail] -> [head|tail] != [head|nil]
   else
     while (current.next != node) && (current.next != nil)
       current = current.next
     end
     # here's the tricky part, because we're deleting a node,
     # [head|tail] -> [head|tail] -> [head|tail], say we're deleting second node
     # now first [head|tail] needs to point to where the old tail pointed, so next.next
     current.next = current.next.next
   end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    # if it's empty, add the node
    if (@head == nil) && (@tail == nil)
      @head = node
      @head.next = nil
      @tail = node
    else
      # set the oldHead to a temp variable
      temp = @head
      # set the new node as the head
      @head = node
      # now bump the oldHead to the next position
      @head.next = temp
    end

  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    # if we don't have a head, or we're at the end, or there's only one node, set it to nil
    if (@head == nil) || (@head.next == nil) || (@head == @tail)
      @head = nil
    else
      # just set the original head to be the next node
      @head = @head.next
    end
  end

# new methods
  def find_node(key)


  end

  def size

  end

end
