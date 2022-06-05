# Given an array of integers, find the one that appears an odd number of times.

# There will always be only one integer that appears an odd number of times.
# Examples

# [7] should return 7, because it occurs 1 time (which is odd).
# [0] should return 0, because it occurs 1 time (which is odd).
# [1,1,2] should return 2, because it occurs 1 time (which is odd).
# [0,1,0,1,0] should return 0, because it occurs 3 times (which is odd).
# [1,2,2,3,3,3,4,3,3,3,2,2,1] should return 4, because it appears 1 time (which is odd).
def find_it(seq)
  seq.group_by(&:to_i).find{|_,nums| nums.count.odd?}.first
end

# detect is find
seq.detect { |n| seq.count(n).odd? }

# https://blog.tarkalabs.com/real-world-uses-of-bitwise-operators-c41429df507f
# Another trick you can achieve using bitwise operators is checking if an 
# integer is even or odd.
# or-ing integers cancel each other out bitwise, so the one odd is left over
seq.reduce(:^)

# faster w uniq
seq.uniq.each {|n| return n if seq.count(n).odd?}

# find (not there in 2.5.0)
seq.find{|c| seq.count(c).odd? }
