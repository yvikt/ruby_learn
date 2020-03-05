require './ges_word_methods'

game_init(select_word)
cls
print_status

while true # пока не угадаются все буквы @wright_count == @uniq_letters


  letter = get_input
  cls
if is_letter_was?(letter)
  @wrong_count += 1
  puts "Вы уже называли букву #{letter.capitalize}"
else
  if is_letter_exist?(letter)
  puts "Есть такая буква #{letter.capitalize} !"
  else
    puts "Нет буквы #{letter.capitalize} в этом слове"
  end
end

print_status
if @original_word == @finding_word
  puts "Поздравляем !"
  exit # завершение программы
end

end