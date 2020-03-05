def get_random_key_value(hash)
  # выбирает случайную запись хеша
  k = hash.keys
  v = hash.values
  rnd = rand(0..k.length-1)
  return {k[rnd] => v[rnd]}
end

def select_word
  # выбор случайного слова
  words = {
      'пылесос' => 'бытовой прибор',
      'яблоко' => 'фрукт',
      'квартира' => 'там где живут люди',
      'мельница' => 'там где делают муку',
      'автомобиль' => 'средство передвижения'
  }
  get_random_key_value(words)
end

def game_init(word)
  @word = word.keys[0]
  @description = word.values[0]
  @word_length = @word.length
  @original_word = @word.split('') # создание массива букв из слова
  @uniq_letters = @original_word.uniq # массив уникальных букв
  @finding_word = [] # угадываемое слово
  @word_length.times do
    @finding_word << '*'
  end
  @wright_letters = [] # создание массива для угаданных букв
  @wrong_letters = [] # создание массива для ошибочных букв
  @wright_count = 0 # счетчик угаданных
  @wrong_count = 0 # счетчик промахов
    # так как используем глобальные переменные return letters, wright_letters, wrong_letters
end

def get_input
  # принимает у пользователя очередной символ
  puts 'введите букву'
  letter = STDIN.gets.chomp
end

def is_letter_was?(letter)
  # проверить вводил ли пользователь уже эту букву
  # проверить массив угаданных и массив неугаданных
  @wright_letters.include?(letter) || @wrong_letters.include?(letter)
end

def is_letter_exist?(letter)
  # проверяет ввод пользователя и сравнивает с оригиналом
  # помещает букву либо в массив угаданых букв, либо  в массив не угаданных
  if @original_word.include?(letter) # проверить есть ли в слове эта буква
    @wright_count += 1 # счетчик угаданных
    @wright_letters << letter # занести в массив угаданных
    @original_word.each_with_index do |item, index|
      if item == letter
        @finding_word[index] = letter # перерисовать текущее слово (открыть буквы)
      end
    end
    return true
  else
    @wrong_count += 1 # счетчик ошибочных
    @wrong_letters << letter # занести в массив ошибочных
    return false
  end
end

# def render_word(letter, position)
#   @finding_word[position] = letter
# end

def print_status # разделить этот метод на два (отладка и режим игры)
  # текущее состояние игры - кол-во букв в слове, кол-во угаданных, кол-во неугаданных,
  # кол-во оставшихся попыток
  # угаданные буквы распечатывает, а неугаданные _
  puts "#{@description} - состоит из #{@word_length} букв"
  # puts "загаданное слово" + @original_word.to_s # dev
  # puts "угадываемое слово" + @finding_word.to_s # dev
  puts "ТАБЛО   " + @finding_word.map{ |i| i.capitalize}.join # вывод большими букавами
  # puts "массив для угаданных букв" + @wright_letters.to_s # dev
  # puts "массив для ошибочных букв" + @wrong_letters.to_s # dev
  # puts "счетчик угаданных #{@wright_count}" # dev
  # puts "счетчик промахов #{@wrong_count}"
end

def cls
  system "clear" or system "cls"
end