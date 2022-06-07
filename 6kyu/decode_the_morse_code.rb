# In this kata you have to write a simple Morse code decoder. 
# While the Morse code is now mostly superseded by voice and 
# digital data communication channels, it still has its use 
# in some applications around the world.

# The Morse code encodes every character as a sequence of 
# "dots" and "dashes". For example, the letter A is coded 
# as ·−, letter Q is coded as −−·−, and digit 1 is coded 
# as ·−−−−. The Morse code is case-insensitive, traditionally 
# capital letters are used. When the message is written in 
# Morse code, a single space is used to separate the 
# character codes and 3 spaces are used to separate words. 
# For example, the message HEY JUDE in Morse code is 
# ···· · −·−−   ·−−− ··− −·· ·.

# NOTE: Extra spaces before or after the code have no meaning 
# and should be ignored.

# In addition to letters, digits and some punctuation, there 
# are some special service codes, the most notorious of 
# those is the international distress signal SOS (that was 
# first issued by Titanic), that is coded as ···−−−···. 
# These special codes are treated as single special 
# characters, and usually are transmitted as separate words.

# Your task is to implement a function that would take the 
# morse code as input and return a decoded human-readable string.

# For example:

# decodeMorse('.... . -.--   .--- ..- -.. .')
# should return "HEY JUDE"

# NOTE: For coding purposes you have to use ASCII characters . 
# and -, not Unicode characters.

# The Morse code table is preloaded for you as a dictionary, feel free to use it:

# Coffeescript/C++/Go/JavaScript/Julia/PHP/Python/Ruby/TypeScript: 
MORSE_CODE['.--']

# All the test strings would contain valid Morse code, so you may skip checking for errors and exceptions. In C#, tests will fail if the solution code throws an exception, please keep that in mind. This is mostly because otherwise the engine would simply ignore the tests, resulting in a "valid" solution.

# Good luck!
def morse_code(word = "")
    word
      .split(' ')
      .map{|char| MORSE_CODE[char]}
      .join('')
  end
  
  def decode_morse(code_phrase = "")
    code_phrase
      .split('   ')
      .map{|word| morse_code(word)}
      .join(' ')
      .tap(&:strip!)
  end
  
  def decodeMorse(morseCode)
    decode_morse(morseCode)
  end
end
# regex
morseCode.strip
.gsub(/[.-]*/) {|charCode| MORSE_CODE[charCode] }
.gsub(/  ?([^\ ])/, '\1') # one or two spaces before non-space,
                            # replace with just the non-space
                            # \1 is capture group
                            # \ before space largely for emphasis?
# regex another
morseCode.gsub(/\s?([\.\-]+)\s?/){MORSE_CODE[$1]}.strip

# nicer method names probly
def decodeMorse(code)
    words(code).map{|w| translate_word(w)}*' '
end

def words(code)
    code.strip.split("   ")
end

def characters(word)
    word.strip.split(" ")
end

def translate_word(word)
    characters(word).map{|c| MORSE_CODE[c]}*''
end

# make a class
def decodeMorse(morse_code)
    MorseDecoder.new(morse_code).decode
end
  
class MorseDecoder
    WORD_DELIMITER = "   ".freeze
    CHAR_DELIMITER = " ".freeze
  
    def initialize(morse)
      @morse = morse.strip.split(WORD_DELIMITER).map { |w| w.split(CHAR_DELIMITER) }
    end
    
    def decode
      morse.map { |word| decode_word(word) }.join(" ")
    end
    
    private
    
    attr_reader :morse
    
    def decode_word(word)
      word.map { |char| MORSE_CODE[char] }.join
    end
end

# call directly
.map(&Hash(MORSE_CODE)
