require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def add_to_tail(node)
    current = @head
    if (@head == nil) && (@tail == nil)
      @head = node
      @tail = node
    else
      while current.next != nil
        current = current.next
      end
      current.next = node
      @tail = node
    end
  end

  def remove_tail
    current = @head
    return nil if @tail == nil
    if @head == @tail
      @head = nil
      @tail = nil
    else
      while (current.next != nil) && (current.next != @tail)
        current = current.next
      end
        @tail = current
        @tail.next = nil
    end
  end

  def print
    return "" if @head == nil
    current = @head
    puts current.data
    while current.next != nil
      current = current.next
      puts current.data
    end
  end

  def delete(node)
    current = @head
    return nil if @tail == nil
    if @head == @tail
      @head = nil
      @tail = nil
    elsif @head == node
      @head = @head.next
    elsif @tail == node
      remove_tail
    else
      while (current.next != node) && (current.next != nil)
        current = current.next
      end
      current.next = current.next.next
    end
  end

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

  def remove_front
    if (@head == nil) || (@head.next == nil) || (@head == @tail)
      @head = nil
    else
      @head = @head.next
    end
  end
end
