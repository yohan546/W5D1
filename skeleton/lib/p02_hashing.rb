

class Integer
  # Integer#hash already implemented for you

end

class Array
  def hash
    accumlater = 0 
    each_with_index do |ele , i|
        (ele.hash + i.hash) ^ accumlater
       accumlater =+  (ele.hash + i.hash)  
    end
    accumlater
  end

end

class String
  def hash
    chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    to_a.sort_by(&:hash).hash
  end
end
