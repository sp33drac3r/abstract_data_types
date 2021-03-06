require 'honey_mushroom/node'
require 'honey_mushroom/linked_list'

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
    node.next.last = node unless node.next.nil?
    @tail = node if @tail.nil?
  end

  def remove_front
    current = @head
    @head = current.next
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

    return s + '@tails'
  end
end
