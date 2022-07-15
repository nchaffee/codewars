# Given two arrays a and b write a function comp(a, b) (orcompSame(a, b)) 
# that checks whether the two arrays have the "same" elements, with the 
# same multiplicities (the multiplicity of a member is the number of times 
# it appears). "Same" means, here, that the elements in b are the 
# elements in a squared, regardless of the order.
# Examples
# Valid arrays

# a = [121, 144, 19, 161, 19, 144, 19, 11]  
# b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]

# comp(a, b) returns true because in b 121 is the square of 11, 14641 is the square of 121, 20736 the square of 144, 361 the square of 19, 25921 the square of 161, and so on. It gets obvious if we write b's elements in terms of squares:

# a = [121, 144, 19, 161, 19, 144, 19, 11] 
# b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]

# Invalid arrays

# If, for example, we change the first number to something else, comp is not returning true anymore:

# a = [121, 144, 19, 161, 19, 144, 19, 11]  
# b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]

# comp(a,b) returns false because in b 132 is not the square of any number of a.

# a = [121, 144, 19, 161, 19, 144, 19, 11]  
# b = [121, 14641, 20736, 36100, 25921, 361, 20736, 361]

# comp(a,b) returns false because in b 36100 is not the square of any number of a.
def els_by_count(arr)
    arr.group_by(&:itself).transform_values(&:count)
  end
  
  def comp(array1, array2)
    return false if array1.nil? || array2.nil?
    els_by_count(array2) == els_by_count(array1.map{|n| n*n})
  end
end

#
a.sort.map {|x| x ** 2} == b.sort
[a, b].none?(&:nil?) && a.map(&:abs2).sort == b.sort
a.sort.map { |i| i**2 } == b.sort
a&.map { |x| x * x }&.sort == b&.sort
array1&.sort&.map(&:abs2) == array2&.sort
[array1, array2].all?(Array)
x.sort.map{|z|z**2} == y.sort rescue false
