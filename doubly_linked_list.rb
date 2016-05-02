require_relative 'node'
require_relative 'linked_list'

class DoublyLinkedList < LinkedList
  attr_accessor :tail
  def initialize
    super
    @tail = nil
  end

  def add(value)
    node = Node.new({value: value, next: nil, last: nil})
    node.next = @head
    @head = node
    node.next.last = node
    @tail = node if @tail.nil?
  end

  def remove_front
    super
    current.next.last = nil

    return current
  end

  def remove_back
    current = @tail
    @tail = current.last
    current.last.next = nil
    return current
  end


  def to_s
    s = '@head<->'
    current = @head
    until current.nil?
      s += "[#{current.value}]<->"
      current = current.next
    end

    return s
  end
end
