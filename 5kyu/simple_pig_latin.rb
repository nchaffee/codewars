# Move the first letter of each word to the end of it, 
# then add "ay" to the end of the word. Leave punctuation 
# marks untouched.
# Examples

# pig_it('Pig latin is cool') # igPay atinlay siay oolcay
# pig_it('Hello world !')     # elloHay orldway !
def punctuation_mark?(word)
    word.match(/[^a-z]/i)
  end
  
  def to_pig(word)
    word[1..-1] + word[0]  + 'ay'
  end
  
  def piggify(word)
    punctuation_mark?(word) ? word : to_pig(word)
  end
  
  def pig_it(text)
    text
    .split()
    .map(&method(:piggify))
    .join(' ')
end

#
text.gsub(/(\w)(\w+)*/, '\2\1ay')
text.gsub(/(\w)(\w*)/){|w| $2 + $1 + 'ay' }
word =~ /\w/ ? "#{word[1..-1]}#{word[0]}ay" : word
word.match(/\W/) ? word : word.chars.rotate(1).join + "ay"
