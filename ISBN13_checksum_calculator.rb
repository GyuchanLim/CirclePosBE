class ISBNCheckSum
  def self.integer_calculator(num)
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
end

