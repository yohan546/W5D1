class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize

    @sentinal = Node.new
    @head = @sentinal
    @tail = @sentinal
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    empty? ? nil: self.head.next 
  end

  def last
    empty? ? nil: self.tail.prev
  end

  def empty?
    self.head.next == self.tail
  end

  def get(key)
  end

  def include?(key)
    any? { |node| node.key == key}
  end

  def append(key, val)
    new_node = Node.new(key, val)

    #                   head_node -> node_1                       node_2 <- tail_node
    #                                  |                             |
    #                              prev-nil, next-nil       prev-nil, next-node_3
    #                                                           
    # append node_3

    #                   head_node -> node_1                       node_2 <- tail_node
    #                                  |                             |
    #                              prev-nil, next-nil       prev-nil, next-node3
    #                                                                         |
    #                                                              prev-node_2, next-tail_node


    #                  head_node -> node_1                      next_node3 <- tail_node
    #                                 |                             |
    #                             prev-nil, next-nil    prev-node_2, next-tail_node
    #                                                                                 
    # 
     #                  head_node -> node_1                      next_node3 <- tail_node
    #                                 |                             |
    #                             prev-nil, next-nil    prev-node_2, next-tail_node    
    
    #append node_4
   #                  head_node -> node_1                      next_node3 <- tail_node
    #                                 |                             |
    #                             prev-nil, next-nil    prev-node_2, next-node_4    




      #                  head_node -> node_1                      next_node3 <- tail_node
    #                                 |                             |
    #                             prev-nil, next-nil    prev-node_2, next-node_4    
        #                                                                  |
        #                                                         prev-node_2, next-tail_node



      #                  head_node -> node_1                      next_node4 <- tail_node
    #                                 |                             |
    #                             prev-nil, next-nil    prev-node_2, next-node_3    
        #                                                                  |
        #                                                         prev-node_2, next-tail_node
    
    self.tail.prev.next = new_node
    new_node.prev = self.tail.prev
    new_node.next = self.tail
    self.tail.prev = new_node


  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
