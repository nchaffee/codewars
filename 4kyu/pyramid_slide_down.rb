# Lyrics...

# Pyramids are amazing! Both in architectural and mathematical sense. 
# If you have a computer, you can mess with pyramids even if you are 
# not in Egypt at the time. For example, let's consider the following 
# problem. Imagine that you have a pyramid built of numbers, like 
# this one here:

#    /3/
#   \7\ 4 
#  2 \4\ 6 
# 8 5 \9\ 3

# Here comes the task...
# Let's say that the 'slide down' is the maximum sum of consecutive 
# numbers from the top to the bottom of the pyramid. As you can see, 
# the longest 'slide down' is 3 + 7 + 4 + 9 = 23

# Your task is to write a function that takes a pyramid representation 
# as argument and returns its' largest 'slide down'. For example:

# * With the input `[[3], [7, 4], [2, 4, 6], [8, 5, 9, 3]]`
# * Your function should return `23`.

# By the way...

# My tests include some extraordinarily high pyramids so as you can 
# guess, brute-force method is a bad idea unless you have a few 
# centuries to waste. You must come up with something more clever 
# than that.

# (c) This task is a lyrical version of the Problem 18 and/or Problem 
# 67 on ProjectEuler.
def longest_slide_down(pyramid)
    while pyramid.length > 1 do
      longer, shorter = [pyramid.pop, pyramid[-1]]
      pyramid[-1] = shorter.map.with_index do |int, idx|
        int + [(longer[idx] || 0), (longer[idx+1]) || 0].max
      end
    end
    pyramid.flatten.first
end

# map! to change it in place, compare a slice of array elements
pyramid.last.map!.with_index {|x, i| x + bottom_row[i, 2].max}

# get pairs to compare with each_cons
best_choices = last_row.each_cons(2).map(&:max)

# boom
pyramid
    .reduce([]) { |slides, row|
      row.size.times.map { |i|
        [slides[i - 1], slides[i]].compact.max.to_i + row[i]
      }
    }
    .max

# recursive with cache
def longest_slide_down(pyramid)
    calc_branch(0, 0, pyramid)
end
  
def calc_branch(level, pos, pyramid, cache={})
    return 0 if level==pyramid.size

    unless cache.has_key? level and cache[level].has_key? pos
        cache[level] ||= {}
        cache[level][pos] = pyramid[level][pos] +
                            [calc_branch(level+1, pos,   pyramid, cache),
                            calc_branch(level+1, pos+1, pyramid, cache)].max
    end

    return cache[level][pos]
end

#
pyramid
    .reverse_each
    .drop(1)
    .reduce(pyramid.last) do |cur_sums, cur_row|
      cur_row.map.with_index do |item, index|
        item + [cur_sums[index], cur_sums[index + 1]].max
      end
    end
    .first

# short
s[-1]=s.pop.each_cons(2).zip(s[-1]).map{|x,y|x.max+y}while s[1]
s[0][0]
