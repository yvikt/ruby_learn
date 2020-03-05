if ARGV.length != 4 || ARGV[0] == 'help'
  puts "введите 4 параметра\n" +
           "1 - количество объектов, 2 - единственное число, 3 - от двух до пяти, 4 - остальные случаи"
  exit
end

number = ARGV[0].chomp.to_i
one_ = ARGV[1].chomp if ARGV[1] != nil
two_four = ARGV[2].chomp if ARGV[2] != nil
zero_five_plus = ARGV[3].chomp if ARGV[3] != nil



def sklonenie(number, one_, two_four, zero_five_plus)
  number %= 100
  if number > 20
    number %= 10
  end

  case number
  when 1
    one_
  when 2..4
    two_four
  else
    zero_five_plus
  end

end

puts sklonenie(number, one_, two_four, zero_five_plus)
