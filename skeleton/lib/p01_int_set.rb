class MaxIntSet
  attr_accessor :store 
  attr_reader :max

  def initialize(max)
    @max = max 
    @store = Array.new(@max, false)
  end

  def insert(num)
    if num.between?(0, @max)
      @store[num] = true
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    i = num % 20
    @store[i] << num
  end

  def remove(num)
    i = num % 20
    @store[i].delete(num)
  end

  def include?(num)
    i = num % 20
    @store[i].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :new_store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num) 
      i = num % num_buckets
      @store[i] << num
      @count += 1
    end
    resize! if @count > num_buckets
  end

  def remove(num)
    unless !include?(num)
      i = num % num_buckets
      @store[i].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    i = num % num_buckets
    @store[i].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store.flatten 
    new_store = Array.new(num_buckets * 2) { Array.new }
    @store = new_store
    old_store.each do |num|
      i = num % new_store.length
      @store[i] << num
    end
  end


end

