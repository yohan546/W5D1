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

    # when we initalize, this is what our base case   
    # @head,@tail = sentinal_node
    # @head.next = @tail, @tail.prev = @head, so at start, it actually looks likes this      

    #             @head = sentinal_node                                                      @tail = sentintal_node  
    #                         |                                                                           | 
    #                prev-nil, [next-sentinal_node]                                   [prev-sentinal_node], next-nil
    #                                   |                                                       |
    #                          prev-nil, next-nil                                    prev-nil, next-nil       
    
    
    #                                   now we append our first node node_1

    
    # self.tail.prev.next = new_node

    #                                                                                        
    #                       @head                                                                       @tail  
    #                         |                                                                           | 
    #                 prev-nil, next-sentinal_node                                      prev-sentinal_node, next,nil
    #                                                                                           |
    #                                                                                 prev-nil, [next-node_1]  


    # new_node.prev = self.tail.prev
    # new_node.next = self.tail

    #                       @head                                                                       @tail   
    #                         |                                                                           | 
    #                 prev-nil, next-sentinal_node                                      prev-sentinal_node, next,nil
    #                                                                                           |
    #                                                                                 prev-nil, next-node_1
    #                                                                                                 |
    #                                                                             [prev-sentinal_node], [next-@tail]
    #                                                                                                   


    # self.tail.prev = new_node    
                                                                                            
    #                       @head                                                                       @tail   
    #                         |                                                                           | 
    #                 prev-nil, next-sentinal_node                                      [prev-node_1], next,nil
    #                                                                                         |
    #                                                                      prev-sentinal_node, next-@tail    


    #  Remember at initalize, @head.next = @tail, @tail.prev = @head, so this next step actually occurs at every iteration

    #                       @head                                                                       @tail 
    #                         |                                                                           | 
    #                 prev-nil, next-sentinal_node                                      prev-node_1, next,nil
    #                                                                                         |
    #                                                                    [prev-sentinal_node], [next-@tail]    


    #                                                 Now we append node_2 


    # self.tail.prev.next = new_node

    #                       @head                                                                       @tail 
    #                         |                                                                           | 
    #                 prev-nil, next-sentinal_node                                      prev-node_1, next,nil
    #                                                                                         |
    #                                                                    prev-sentinal_node, [next-node_2]   


    # new_node.prev = self.tail.prev
    # new_node.next = self.tail

    #                       @head                                                                       @tail 
    #                         |                                                                           | 
    #                 prev-nil, next-sentinal_node                                      prev-node_1, next,nil
    #                                                                                         |
    #                                                                    prev-sentinal_node, next-node_2   
    #                                                                                             |
    #                                                                                         [prev-node_1],[next-@tail]


    # self.tail.prev = new_node

    #                       @head                                                                       @tail 
    #                         |                                                                           | 
    #                 prev-nil, next-sentinal_node                                      [prev-node_2], next,nil
    #                                                                                         |
    #                                                                             prev-node_1, next-@tail


    #                                                 now we append node_3


    # self.tail.prev.next = new_node

    #                       @head                                                                       @tail 
    #                         |                                                                           | 
    #                 prev-nil, next-sentinal_node                                      prev-node_2, next,nil
    #                                                                                         |
    #                                                                             prev-node_1, [next-node_3]
    
    
    # new_node.prev = self.tail.prev
    # new_node.next = self.tail
    
    #                       @head                                                                       @tail 
    #                         |                                                                           | 
    #                 prev-nil, next-sentinal_node                                      prev-node_2, next,nil
    #                                                                                         |
    #                                                                             prev-node_1, next-node_3
    #                                                                                               |
    #                                                                                  [prev-node_2],[next-@tail]


    # self.tail.prev = new_node

    #                       @head                                                                       @tail 
    #                         |                                                                           | 
    #                 prev-nil, next-sentinal_node                                      [prev-node_3], next,nil
    #                                                                                          |
    #                                                                               prev-node_2, next-@tail


    #                       @head                                                                       @tail 
    #                         |                                                                           | 
    #                 prev-nil, next-@tail                                                      @head, next,nil
    #                                   |                                                          |
    #                       [prev-node_3], next,nil                                       prev-nil, next-@head
    #                              |     
    #                  |prev-node_2, next-@tail



    
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
