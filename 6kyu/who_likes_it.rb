# https://www.codewars.com/kata/5266876b8f4bf2da9b000362/train/ruby

def likes(names)
    one, two, three = names.slice(0,3)
    case names.length
    when 0 then 'no one likes this'
    when 1 then "#{one} likes this"
    when 2 then "#{one} and #{two} like this"
    when 3 then "#{one}, #{two} and #{three} like this"
    else "#{one}, #{two} and #{names.length - 2} others like this"
    end
  end

# use %s  
def likes(names)
    case names.size
    when 0 then "no one likes this"
    when 1 then "%s likes this"           % names
    when 2 then "%s and %s like this"     % names
    when 3 then "%s, %s and %s like this" % names
    else "%s, %s and %d others like this" % (names[0,2] + [names.size-2])
    end
  end
