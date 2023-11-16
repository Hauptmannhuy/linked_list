class LinkedList
  attr_accessor :head, :tail
  def initialize
   @head = nil
   @tail = nil

  end

  
  def append(value = rand(100).to_s)
    new_node = Node.new(value)
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
  
  def prepend(value = rand(100).to_s)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    elsif !@head.nil? && @tail.nil?
      @tail = @head
      @head = new_node
      @head.next_node = @tail
    elsif !@head.nil? && !@tail.nil?
      old_node_refference = @head
      @head = new_node
      @head.next_node = old_node_refference
    end
  end

  def to_s
    output = ''
    current = @head
    while current
      output = output + "( #{current.value} )" + ' -> '
    current = current.next_node
    end
    output += 'nil'
  end

  def pop
   previous = @head
   (self.size-2).times do
    previous = previous.next_node
   end
   out = @tail
   @tail = previous
   @tail.next_node = nil
   out
  end

  def contains?(value)
    current = @head
    while current
    return true if current.value == value
    current = current.next_node
    end
    false
  end

  def find(value)
    index = 0
    current = @head
    while current
      return index if current.value == value
      current = current.next_node
      index+=1
    end
    nil
  end

def size
  count = 0
  current = @head    
  while current 
    count+=1
    current = current.next_node
  end
  count
end

def insert_at(index,value)
  new_node = Node.new(value)
  current = @head
  size = self.size
  if index == 0 
  prepend(value)
  @head.value = value
  self
  elsif index == size
    append(value)
    @tail.value = value
    self
  elsif index >= 1 && index < size
    (index-1).times {current = current.next_node}
    new_node.next_node = current.next_node
    current.next_node = new_node
    self
   else
   'Invalid index'
  end

end


def get_head
  @head
#  ["Node: #{self.head.instance_variable_get(:@value)}, next node is #{self.head.next_node.instance_variable_get(:@value)}"]
end

def get_tail
  @tail
end

def at (index)
  return "Specified node doesn't exist" if index > self.size
  current = @head
  index.times do
    current = current.next_node
  end
  current.instance_variable_get(:@value)
end

end

class Node
  attr_accessor :value, :next_node
  def initialize(value = rand(100).to_s)
    @value = value
    @next_node = nil
  end
end

list = LinkedList.new()
list.prepend
list.append
list.append
