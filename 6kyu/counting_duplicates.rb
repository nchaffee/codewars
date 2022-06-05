# Count the number of Duplicates

# Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.
# Example

# "abcde" -> 0 # no characters repeats more than once
# "aabbcde" -> 2 # 'a' and 'b'
# "aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
# "indivisibility" -> 1 # 'i' occurs six times
# "Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
# "aA11" -> 2 # 'a' and '1'
# "ABBA" -> 2 # 'A' and 'B' each occur twice
def duplicate_count(text)
    a = text.downcase.chars
    a.uniq.map{|char| a.count(char)}.filter{|n| n > 1}.count
end

# check by alphabet
('a'..'z').count { |c| text.downcase.count(c) > 1 }

# similar
arr = text.downcase.split("")
arr.uniq.count { |n| arr.count(n) > 1 }

# crude
hsh = Hash.new(0)
text.downcase.chars.each { |c| hsh[c] += 1 }
hsh.values.count { |k| k > 1 }

# what i wanted to do initially
text.downcase.chars.group_by(&:to_s).count { |_, v| v.count > 1 }

# tally from 2.7 on
text.downcase.chars.tally.count { |k, v| v > 1 }

# chunk makes something like this
# => 
# [["d", ["d", "d", "d", "d"]],                                  
#  ["f", ["f", "f", "f", "f", "f"]],                             
#  ["g", ["g", "g"]],                                            
#  ["s", ["s", "s", "s", "s"]]]
text.downcase.chars.sort
.chunk { |c| c }
.count { |_, occurrences| occurrences.count > 1 }

# make ur eyes bleed w regex
text.scan(/(\w)(?=(?!.*\1.*\1).*\1)/i).length
