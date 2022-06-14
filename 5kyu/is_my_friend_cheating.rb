# A friend of mine takes the sequence of all numbers from 1 to n (where n > 0).
# Within that sequence, he chooses two numbers, a and b.
# He says that the product of a and b should be equal to the sum of all numbers
#     in the sequence, excluding a and b.
# Given a number n, could you tell me the numbers he excluded from the sequence?

# The function takes the parameter: n (n is always strictly greater than 0) and 
# returns an array or a string (depending on the language) of the form:

# [(a, b), ...] or [[a, b], ...] or {{a, b}, ...} or or [{a, b}, ...]

# with all (a, b) which are the possible removed numbers in the sequence 1 to n.

# [(a, b), ...] or [[a, b], ...] or {{a, b}, ...} or ... will be sorted in 
# increasing order of the "a".

# It happens that there are several possible (a, b). The function returns an 
# empty array (or an empty string) if no possible numbers are found which will 
# prove that my friend has not told the truth! (Go: in this case return nil).
# Examples:

# removNb(26) should return [(15, 21), (21, 15)]
def removNb(n)
  sum = (n*(n+1))/2 * 1.0 # same as (1..n).sum
  result = []
  n.downto(n/2) do |a|
      b = (sum - a) / (a + 1)
      if b < a &&  b % b.to_i == 0
        result.push([a,b.to_i])
        result.push([b.to_i,a])
      end
  end
  result.uniq.sort
end

# this guy gets it
results = []
sequence = (1..n).to_a.reverse
sum = sequence.inject(&:+)

sequence.each do |num|
  mod = sum % num
  if num * mod == (sum - num - mod )
    results += [[mod, num], [num, mod]]
  end
end
results.sort
