# Given a positive number n > 1 find the prime factor decomposition of n. 
# The result will be a string with the following form :

#  "(p1**n1)(p2**n2)...(pk**nk)"

# with the p(i) in increasing order and n(i) empty if n(i) is 1.

# Example: n = 86240 should return "(2**5)(5)(7**2)(11)"
require 'prime'
# quick way
def prime_factors(n)
  Prime.prime_division(n).map do |base, exp|
    exp == 1 ? "(#{base})" : "(#{base}**#{exp})"
  end.join()
end

# manual
def prime_factors(n)
  total = n
  p = Prime.each
  res = []
  while total > 1 do
    prime = p.take(1).first
    count = 0
    while total % prime == 0 do
      count += 1
      total /= prime
    end
    res.push([prime,count]) if count > 0
  end
  res.map do |base, exp|
    exp == 1 ? "(#{base})" : "(#{base}**#{exp})"
  end.join()
end

# could also iterate on Prime.each and break if n == 1
# but why would this be the max prime to check?
max_size = 10 ** n.to_s.chars.size
Prime.each(max_size) do end
