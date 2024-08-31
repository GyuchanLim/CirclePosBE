require_relative "ISBN13_checksum_calculator"

File.open('testcases.txt', 'w') { |file|
  file.write("ISBN13, Checksum\n") 

  (1..10).each do |i|
    num = rand(10**10..10**11) # Generate a 12 digit number
    checksum = ISBNCheckSum.calculate(num)
    
    file.write("#{num}, #{checksum}\n") 
  rescue => e
    file.write("#{e}\n") 
  end
}

