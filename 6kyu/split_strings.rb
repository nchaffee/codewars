# Complete the solution so that it splits the string into pairs of two characters. If the string contains an odd number of characters then it should replace the missing second character of the final pair with an underscore ('_').

# Examples:

# * 'abc' =>  ['ab', 'c_']
# * 'abcdef' => ['ab', 'cd', 'ef']
def solution(str)
    result = (str.length % 2 == 0) ? str : str + '_'
    result.chars.each_slice(2).to_a.map(&:join)
  end

def solution str
  (str + '_').scan /../
end
