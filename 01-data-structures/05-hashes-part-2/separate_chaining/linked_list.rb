require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    current = @head
    if (@head == nil)
      @head = node
    else
      current.next = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    current = @head
    return nil if @tail == nil
    if @head == @tail
      @head = nil
    else
      @tail = current
      @tail.next = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    current = @head
    return "" if @head == nil
    until current.next == nil
      current = current.next
      puts current.data
    end

  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
   current = @head
   return nil if @tail == nil
   if (@head == @tail)
     @head = nil
     @tail = nil
   elsif (@head == node)
     @head = @head.next
   elsif (@tail == node)
     remove_tail
   else
     while (current.next != node) && (current.next != nil)
       current = current.next
     end
     current.next = current.next.next
   end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if (@head == nil) && (@tail == nil)
      @head = node
      @head.next = nil
      @tail = node
    else
      temp = @head
      @head = node
      @head.next = temp
    end

  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if (@head == nil) || (@head.next == nil) || (@head == @tail)
      @head = nil
    else
      @head = @head.next
    end
  end

end
