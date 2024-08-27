def integer_checksum_calculator(num)
  total = 0
  count = 3

  while num != 0
    digit = num % 10
    num = num / 10
    total += digit * (count % 4)
    count += 2
  end

  return (10 - (total % 10) ) % 10
end

def string_checksum_calculator(num)
  total = 0
  count = 1

  num.to_s.chars.each do |digit|
    total += digit.to_i * (count % 4)
    count += 2
  end

  return (10 - (total % 10) ) % 10
end

testcases = [
  978014300723, # 7
  381073818644  # 3
]

testcases.each do |c| 
  pp "#{c}, #{string_checksum_calculator(c)}"
end

File.open('testcases.txt', 'w') { |file|
  file.write("ISBN13, Checksum\n") 
  (1..100).each do |i|
    num = rand(10**11..10**12)
    string_checksum = string_checksum_calculator(num)
    integer_checksum = integer_checksum_calculator(num)
    pp "Mismatch! #{string_checksum} #{integer_checksum}" if string_checksum != integer_checksum
    file.write("#{num}, #{string_checksum}\n") 
  end
}
