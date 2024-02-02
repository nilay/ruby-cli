def method(n)
  sum = 0
  (0..n).to_a.each { |num| sum += num if divisable_by_any?(num, [3,5,7]) }
  sum
end
def divisable_by_any?(n, arr)
  arr.each { |num| return true if n%num == 0}
  false
end



def method2(text)
  result = ''
  prev_char = nil
  text.each_char do |char|
    result << ( (is_vowel?(char) && !is_vowel?(prev_char)) ? 'av' : char )
    prev_char = char
  end
  result
end

def is_vowel?(char)
  %w[a e i o u].include?(char)
end
puts method2('hello secret')
