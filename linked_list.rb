class LinkedList
  attr_accessor :head, :tail
  def initialize
   @head = nil
   @tail = nil
  end
  def append
    new_node = Node.new()
    if @head.nil?
      @head = new_node
    elsif @tail.nil?
      @head.next_node = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
    end
  
  def prepend
    
  end

  
end

class Node
  attr_accessor :value, :next_node
  def initialize
    @value = nil
    @next_node = nil
  end
  
end

list = LinkedList.new()
list.append