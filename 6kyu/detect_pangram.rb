# A pangram is a sentence that contains every single letter of the 
# alphabet at least once. For example, the sentence "The quick brown 
# fox jumps over the lazy dog" is a pangram, because it uses the 
# letters A-Z at least once (case is irrelevant).

# Given a string, detect whether or not it is a pangram. Return 
# True if it is, False if not. Ignore numbers and punctuation.
def pangram?(string)
    ('a'..'z').all?{|char| string.downcase.match(/#{char}/)}
end

# like it
string.downcase.scan(/[a-z]/).uniq.size == 26

# yes
("A".."Z").to_a - s.upcase.chars == []

# lower letter shorthand & quick regex with []
(?a..?z).all?{|c|s[/#{c}/i]}

# putting true false at the end when you don't trust it
string.downcase.chars.sort.uniq.join =~ /abcdefghijklmnopqrstuvwxyz/ ? true : false

# one line-iest of one liners
def pangram?(w)= w.downcase.scan(/[a-z]/).uniq.size == 26

# makes a lot of sense tbh
('a'..'z').all?(Set.new(string.downcase.each_char))
