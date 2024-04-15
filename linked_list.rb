class Node
  attr_accessor :nxt, :value

  def initialize(value, nxt = nil)
    @value = value
    @nxt = nxt
  end
end

class LinkedList

  def initialize
    @head = nil
  end

  # add node at the end of Linked List
  def push(value)
    if @head.nil?
      @head =  Node.new(value)
    else
      node = @head
      until(node.nxt.nil?)
        node = node.nxt
      end
      node.nxt = Node.new(value)
    end
  end

  # walk through all the node form begining to end
  def traverse
    node = @head
    until node.nil?
      yield node.value
      node = node.nxt
    end
  end

  # print all node's value
  def pretty_print
    traverse { |val| puts val }
  end
end
