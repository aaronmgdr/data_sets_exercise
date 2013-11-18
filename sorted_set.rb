require 'pry'
class BasicArraySortedSet
  # Create your internal data structure here. It should be an empty array
  def initialize
   @array = []
  end

  def name
    "Basic Array"
  end

  # Use the array's native insert method
  def insert(element)
    if @array.include?(element) 
      false
    else
     @array.push(element)
    end
  end

  # Use the array's native include method
  def include?(element)
    @array.include?(element)
  end

  # Use the array's native sort method
  def get_sorted_array
    @array.sort
  end
end

# Similar to above, use the hash's internal methods to implement
# the sorted set's methods
class HashSortedSet
  def initialize
    @hash = {}
  end

  def name
    "Basic Hash"
  end

  # Insert the key value pair (element, true)
  def insert(element)
    unless @hash.include?(element)
      @hash[element] = true
    else 
      false
    end
  end

  def include?(element)
    @hash.include?(element)
  end

  def get_sorted_array  
    @hash.keys.sort
  end
end

# Internally use an array to represent the set
# Maintain alphabetical order within the array, so that you can return
# it when asking for sorted array
class ArraySortedSet

  def initialize
    @array = []
  end
  def name
    "Sorted Array"
  end

  def size
    @array.length
  end

  def index_val(index)
    return @array[index]
  end

  # Insert the element at the proper index to maintain the sort order
  def insert(element)
    
    if @array.empty?
      @array.push(element)
    elsif @array.include?(element)
      false
    elsif @array.last < element
      @array.push(element)
    else
      @array.each_with_index do |x, i|
        if x > element 
          @array.insert(i, element)
          return @array
        end
      end
    end
  end

  def include?(element)
    @array.include?(element) 
  end

  # You should be able to simply return the original array
  def get_sorted_array
    @array
  end

  def to_s
    @array
  end
end


class BinaryArraySortedSet
  def initialize
   @barry = ArraySortedSet.new
  end

  def name
    "Bsearch Array"
  end

  # Insert the element and maintain sorted order
  def insert(element)
     @barry.insert(element)
  end

  # Search for the element using binary search
  def include?(element)
    bigness = @barry.size - 1
    binary_search(0, bigness, element)
  end

  # Return the original array (it should be sorted)
  def get_sorted_array
    @barry.to_s
  end

  # A little helper method to help you implement binary search
  # This method should run as follows
  #   If the subset has 0 or 1 element, do a simple search
  #   If the subset has more than 1 element...
  #     Find the midpoint of the range
  #     Compare if the middle element is higher or lower than your element
  #       If the element is higher
  #         Do a binary_search on the lower half
  #       If the element is lower
  #         Do a binary search on the upper half
  def binary_search(from_index, to_index, element)
    bottom  = from_index
    top     = to_index 
    loop do
      middle = (top + bottom) / 2
      if @barry.index_val(middle) < element
        bottom = middle
      else
        top = middle
      end
      if top - bottom < 2
        return @barry.index_val(middle) == element
      end
    end
  end
end