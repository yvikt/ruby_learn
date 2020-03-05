# get random KEY => VALUE
words = {
    'пылесос' => 'бытовой прибор',
    'яблоко' => 'фрукт',
    'квартира' => 'там где живут люди',
    'мельница' => 'там где делают муку',
    'автомобиль' => 'средство передвижения'
}

def get_random_key_value(hash)
  k = hash.keys
  v = hash.values
  rnd = rand(0..k.length-1)
  return {k[rnd] => v[rnd]}
end

puts get_random_key_value(words)

