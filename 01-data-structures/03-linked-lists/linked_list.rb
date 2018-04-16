require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    current = @head
    # if we don't have a head or tail, set both to equal the node (input) value
    if (@head == nil) && (@tail == nil)
      @head = node
      @tail = node
    else
      # otherwise, travese the nodes until you come to the end
      while current.next != nil
        current = current.next
      end
      # now that we have the last node, add the input node to the "tail"
      current.next = node
      # update the new tail value
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    current = @head
    # if there is no tail, return nil. Simplifying if/else statements below by putting this as a one-liner.
    return nil if @tail == nil
    # if the head is equal to the tail, list is only one node so set both to nil
    if @head == @tail
      @head = nil
      @tail = nil
    else
      # traverse the nodes until you come to the tail
      while (current.next != nil) && (current.next != @tail)
        current = current.next
      end
      # now we can update the tail, and setting the next value to nil
        @tail = current
        @tail.next = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    # if the list is empty, return an empty string, otherwise print out the list
    return "" if @head == nil
    current = @head
    puts current.data
    while current.next != nil
      current = current.next
      puts current.data
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    current = @head
    return nil if @tail == nil
    # possible conditions, head=tail, head = node, tail = node, or tail = nil (addressed above)
    if @head == @tail
      @head = nil    # if head equals tail, list is length one, so set both to nil
      @tail = nil
    elsif @head == node
       @head = @head.next  #if the head is what we want to delete, update the head
    elsif @tail == node
       remove_tail  #if tail equals node, remove it
    else
      # otherwise, traverse the nodes
      while (current.next != node) && (current.next != nil)
        current = current.next
      end
      # set the value to nil
      current.next = current.next.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    # if head and tail are nil, set them equal to input value.
    if (@head == nil) && (@tail == nil)
      @head = node
      @head.next = nil
      @tail = node
    else
      # otherwise, put the current head in a temp variable, make the new node the head, set the next node to old head
      temp = @head
      @head = node
      @head.next = temp
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    # if there is no head, or only one node, set head to nil
    if (@head == nil) || (@head.next == nil) || (@head == @tail)
      @head = nil
    else
      # set value to second node, which will be the "next"
      @head = @head.next
    end
  end
end
