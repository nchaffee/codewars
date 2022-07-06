def shorten_number(suffixes, base)
    lambda do |str|
      return str.to_s if str.class != String || str[/[^\d]/]
      res = ''
      suffixes.reverse_each.with_index do |suff, idx|
        pre = str.to_i / base.pow(suffixes.size - idx - 1)
        res = pre.to_s + suff if pre > 0 && res.empty?
      end
      res
    end
end

# you can return from inside the iterator
def shorten_number(suffixes, base)
    lambda do |num|
      return num.to_s unless num.is_a?(String) && num =~ /\A[0-9]+\z/
      suffixes.each_with_index.to_a.reverse.each do |s, i| 
          return "#{num.to_i / (base ** i)}#{s}" if num.to_i >= base ** i
      end
    end
end

# you can rescue instead of guarding
Proc.new do |n|
    begin
      suffixes.map.with_index{|v,i| "#{Integer(n)/(base**i)}#{v}" if Integer(n)/(base**i) > 0 }.compact.last
    rescue
      n.to_s
    end
end

# can use arrow insteaf of proc,lam
->(s) {
    ...
}

# best one maybe
proc { |s|
    if s =~ /\A\d+\z/
      num = s.to_i
      suffixes.each_with_index { |suffix, i|
        pow = base ** i
        s = "#{num/pow}#{suffix}" if num >= pow
      }
    end
    s.to_s
}
