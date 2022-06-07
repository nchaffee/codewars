# Check to see if a string has the same amount of 'x's and 'o's. The method must return a boolean and be case insensitive. The string can contain any char.

# Examples input/output:

# XO("ooxx") => true
# XO("xooxx") => false
# XO("ooxXm") => true
# XO("zpzpzpp") => true // when no 'x' and 'o' is present should return true
# XO("zzoo") => false
EX_OH = %w{x o}

def XO(str)
  EX_OH
    .map {|char| str.downcase.chars.count(char)}
    .uniq
    .count == 1
end

# count for string
str.downcase.count('x') == str.downcase.count('o')
str.count('Xx') == str.count('oO')
# scan for string
str.scan(/o/i).count == str.scan(/x/i).count
# clunky regex
str.count('/x|X/') == str.count('/o|O/')

