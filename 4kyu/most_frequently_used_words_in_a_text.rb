# Write a function that, given a string of text (possibly with punctuation 
# and line-breaks), returns an array of the top-3 most occurring words, 
# in descending order of the number of occurrences.
# Assumptions:

# A word is a string of letters (A to Z) optionally containing one or more apostrophes (') in ASCII.
# Apostrophes can appear at the start, middle or end of a word ('abc, abc', 'abc', ab'c are all valid)
# Any other characters (e.g. #, \, / , . ...) are not part of a word and should be treated as whitespace.
# Matches should be case-insensitive, and the words in the result should be lowercased.
# Ties may be broken arbitrarily.
# If a text contains fewer than three unique words, then either the top-2 or top-1 words should be returned, or an empty array if a text contains no words.

# Examples:

# top_3_words("In a village of La Mancha, the name of which I have no desire to call to
# mind, there lived not long since one of those gentlemen that keep a lance
# in the lance-rack, an old buckler, a lean hack, and a greyhound for
# coursing. An olla of rather more beef than mutton, a salad on most
# nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
# on Sundays, made away with three-quarters of his income.")
# # => ["a", "of", "on"]

# top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")
# # => ["e", "ddd", "aa"]

# top_3_words("  //wont won't won't")
# # => ["won't", "wont"]

# Bonus points (not really, but just for fun):

#     Avoid creating an array whose memory footprint is roughly as big as the input text.
#     Avoid sorting the entire array of unique words.
def top_3_words(text)
    tally = Hash.new(0)
    tmp = ''
    text
      .downcase
      .gsub(/[^a-z\']/, ' ')
      .concat(' ')
      .each_char do |char|
        if char != ' '
          tmp = tmp.concat(char)
        elsif tmp.length > 0
          not_word = tmp.gsub('\'', '').length == 0
          tally[tmp] = tally[tmp] + 1 unless not_word
          tmp = ''
        end
    end
    tally.to_a.max(3){|a,b| a.last <=> b.last }.map(&:first)
end

#
text.scan(/[A-Za-z']+/)
      .select { |x| /[A-Za-z]+/ =~ x }
      .group_by { |x| x.downcase }
      .sort_by { |k,v| -v.count }
      .first(3)
      .map(&:first)

#
arr = text.downcase.scan(/\w(?:'|\w)*/)
arr.uniq.max_by(3){|w| arr.count w }

#
text.scan(/\w[\w']*/i)
.each_with_object(Hash.new(0)) {|word, freq| freq[word.downcase] += 1}
.sort {|a, b| b.last <=> a.last}
.take(3)
.map(&:first)

#
text.downcase
.scan(/[a-z]+'?[a-z]*/)
.group_by(&:itself)
.transform_values(&:count)
.sort_by(&:last)
.reverse
.map(&:first)
.take(3)
