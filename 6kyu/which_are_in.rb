# Given two arrays of strings a1 and a2 return a sorted array r 
# in lexicographical order of the strings of a1 which are 
# substrings of strings of a2.
# Example 1:
# a1 = ["arp", "live", "strong"]
# a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
# returns ["arp", "live", "strong"]
# Example 2:
# a1 = ["tarp", "mice", "bull"]
# a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
# returns []
# Beware: r must be without duplicates.
def in_array(array1, array2)
    array1.select do |a1_str|
        array2.any?{|a2_str| a2_str.scan(a1_str).any?}
    end.sort
end

# if it's any, you can just join array2
# include? would also work instead of regex
array1.select { |word| array2.join =~ /#{word}/ }.sort

# another regex
a1.reject {|w| !a2.join.match(/#{w}/)}.sort
# or
a1.select {|w| a2.join.match(/#{w}/)}.sort

# if u map u have to go thru the trouble of flatten, uniq
array1.map{ |e| array2.join.scan(e) }.flatten.uniq.sort

# here's another way to sort
.sort_by { |str| str.bytes }

# cleaner & more direct
array1.select{|x| array2.any?{|y| y[x]}}.sort
