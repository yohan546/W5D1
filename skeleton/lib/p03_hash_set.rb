class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include? key
    val = key.hash % num_buckets
    @store[val] << key.hash
    @count += 1
    end
    resize! if @count > num_buckets
  end

  def include?(key)
    val = key.hash % num_buckets
    @store[val].include?(key.hash) 
  end

  def remove(key)
    unless !include? key
      val = key.hash % num_buckets
      @store[val].delete(key.hash)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store.flatten 
    new_store = Array.new(num_buckets * 2) { Array.new }
    @store = new_store
    old_store.each do |ele|
      i = ele.hash % new_store.length
      @store[i] << ele.hash
    end
  end
end
