# Snail Sort

# Given an n x n array, return the array elements arranged from outermost 
# elements to the middle element, traveling clockwise.

# array = [[1,2,3],
#          [4,5,6],
#          [7,8,9]]
# snail(array) #=> [1,2,3,6,9,8,7,4,5]

# For better understanding, please follow the numbers of the next 
# array consecutively:

# array = [[1,2,3],
#          [8,9,4],
#          [7,6,5]]
# snail(array) #=> [1,2,3,4,5,6,7,8,9]

# This image will illustrate things more clearly:

# NOTE: The idea is not sort the elements from the lowest value to the 
# highest; the idea is to traverse the 2-d array in a clockwise snailshell 
# pattern.

# NOTE 2: The 0x0 (empty matrix) is represented as en empty array inside 
# an array [[]].
def snail(array)
    res = []
    loop do
      array.shift.each{|n| res.push(n)} # l->r top level
      array.each{|a| res.push(a.pop)} # down right col
      break if array.empty?
      array.pop.reverse.each{|n| res.push(n)} # l<-r bottom level
      break if array.empty?
      array.reverse.each{|a| res.push(a.shift)} # up left col
    end
    res
end

# rotate and shift
array.empty? ? [] : array.shift + snail(array.transpose.reverse)

# same
def snail(array)
    result = []
    while array.flatten.any?
      result << array.shift
      array = array.transpose.reverse
    end
    result.flatten
end

# more adding
def snail(array)
    array.empty? ? [] : array[0] + snail(array[1..-1].transpose.reverse)
end

# step by step semantic
def snail(array)
    path = array.dup
    snail_path = []
    direction = [:right, :down, :left, :up].cycle
    
    case direction.next
    when :right
      snail_path << path.shift
    when :down
      path.each{|row| snail_path << row.pop}
    when :left
      snail_path << path.pop.reverse
    when :up
      path.reverse.each{|row| snail_path << row.shift}
    end until path.empty?
    
    snail_path.flatten
end
