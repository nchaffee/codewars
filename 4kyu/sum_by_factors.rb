# Given an array of positive or negative integers
# I= [i1,..,in]
# you have to produce a sorted array P of the form

# [ [p, sum of all ij of I for which p is a prime factor (p positive) of ij] ...]

# P will be sorted by increasing order of the prime numbers. 
# Example:

# I = [12, 15] # result = [[2, 12], [3, 27], [5, 15]]

# [2, 3, 5] is the list of all prime factors of the elements of I, hence the result.

# Notes:

# It can happen that a sum is 0 if some numbers are negative!

# Example: I = [15, 30, -45] 5 divides 15, 30 and (-45) so 5 appears in the result, 
# the sum of the numbers for which 5 is a factor is 0 so we have [5, 0] in the result 
# amongst others.

# https://jdmeducational.com/how-to-find-prime-factors-of-a-number-4-key-steps/
# https://ruby-doc.org/stdlib-2.5.0/libdoc/prime/rdoc/Prime.html#method-i-int_from_prime_division

require 'prime'

def sum_by_factors(int_array)
  int_array
    .reduce(Hash.new(0)) do |memo,int| 
      Prime
        .prime_division(int)
        .each{|prime,_exp| memo[prime] += int if prime > 1}
      memo
    end
    .to_a
    .sort
end

# go from prime_divison straight to each
def sumOfDivided(lst)
    factors = Hash.new(0)
    lst.each do |n|
      n.abs.prime_division.each do |p,_|
        factors[p] += n
      end
    end
    factors.sort
end

# Prime.each
Prime.each(list.map(&:abs).max).map do |prime|
    have_factor = list.select { |x| x % prime == 0 }
    [ prime, have_factor.sum ] unless have_factor.empty?
end.compact

# finding factors manually
def factors(n)
    n = n.abs
    div = (1..n)
    div.each_with_object([]) do |x, res|
      if (n.modulo(x) == 0) 
        if (x > 1 && (1..x/2).select {|p| x % p == 0}.size == 1)
          res << x
        end
      end
    end
end
