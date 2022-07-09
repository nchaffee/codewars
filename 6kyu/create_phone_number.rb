# Write a function that accepts an array of 10 integers (between 0 and 9), 
# that returns a string of those numbers in the form of a phone number.
# Example

# createPhoneNumber([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]) # => returns "(123) 456-7890"

# The returned format must be correct in order to complete this challenge.
# Don't forget the space after the closing parentheses!
def create_phone_number(n)
    "(%s) %s-%s" % [n.shift(3)*'',n.shift(3)*'',n*'']
end

#
'(%d%d%d) %d%d%d-%d%d%d%d' % array

#
format('(%s) %s-%s%s', *numbers.each_slice(3).to_a.map(&:join))

#
area_code, prefix, *extension = digits.each_slice(3).map(&:join)
"(%s) %s-%s" % [0..2, 3..5, 6..-1].map { |r| numbers[r].join }

#
numbers.join.gsub /(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3'
numbers.join.gsub(/(...)(...)/,'(\1) \2-')

#
numbers.join("").insert(0, "(").insert(4, ") ").insert(9, "-");
numbers.insert(6, '-').insert(3, ' ').insert(3, ')').insert(0, '(').join

#
ar[0, 0] = "("
ar[4, 0] = ")"
ar[5, 0] = " "
ar[9, 0] = "-"
ar.join

numbers.insert(0,"(")
numbers.insert(4,") ")
numbers.insert(8,"-")
return numbers.join
