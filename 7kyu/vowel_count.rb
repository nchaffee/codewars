# Return the number (count) of vowels in the given string.

# We will consider a, e, i, o, u as vowels for this Kata (but not y).

# The input string will only consist of lower case letters and/or spaces.
input_str.scan(/[aeiou]/).size

#
inputStr.count("aeiou")
#
str.size - str.tr('aeiou', '').size
#
inputStr.chars.select{|i| i=~(/[aeiou]/)}.count
#
inputStr.chars.count { |char| true if char =~ detect_vowels }
