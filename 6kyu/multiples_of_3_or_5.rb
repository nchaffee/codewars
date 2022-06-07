# If we list all the natural numbers below 10 that are 
# multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of 
# these multiples is 23.

# Finish the solution so that it returns the sum of all 
# the multiples of 3 or 5 below the number passed in. 
# Additionally, if the number is negative, return 0 
# (for languages that do have them).

# Note: If the number is a multiple of both 3 and 5, 
# only count it once.
MULTIPLES = [3, 5]
def divisible?(num)
  MULTIPLES.any?{|m| num % m == 0}
end

def solution(number)
  return 0 if number < 0
  (0..(number - 1)).select{|n| divisible?(n)}.sum
end

# keep it short
(1...number).select {|i| i%3==0 || i%5==0}.inject(:+)

# shows more understanding of math but not nice to read
# uses a formula for the sum of the first and last digit: n * (n+1) / 2
# 15s are subtracted because those are counted twice already
num3 = (number-1)/3 # includes the numbers divis by 5, meaning 15
num5 = (number-1)/5 # also includes the 15s, so we better subtract them
num15 = (number-1)/15
(3+3*num3)*num3/2+(5+5*num5)*num5/2-(15+15*num15)*num15/2
