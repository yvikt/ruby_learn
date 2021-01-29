require 'pony'
require 'io/console'
require 'highline'

mailbox = 'box@mail.com'
password = 'password'

# puts "Введите пароль от вашей почты #{mailbox} для отправки письма:"
# password = STDIN.gets.chomp
# password = STDIN.noecho(&:gets).chomp # невидимый ввод пароля ХорошийПрограммист
# password = IO::console.getpass "Enter Password: " # еще один способ
# cli = HighLine.new
# password = cli.ask("Password:  ") { |q| q.echo = "*" }

# puts "Кому отправить письмо? Введите адрес:"
# send_to = STDIN.gets.chomp
send_to = 'victor.novatis@gmail.com'

# puts "Что написать в письме?"
# body = STDIN.gets.chomp.encode("UTF-8")
time = Time.now
body = "test mail\n" + time.strftime("%Y-%m-%d_%H:%M:%S") + "\n" + '<h3>html )</h3>'

puts 'хотите прикрепить файл? y/n'
if attach = STDIN.gets.chomp == 'y'
  puts 'введите имя файла'
  file_name = STDIN.gets.chomp # имя файла (в текущей директории)
  attach_path = __dir__ + '/' + file_name # путь к файлу
  file_content = File.read(attach_path) # содержимое файла
  attachments = {file_name => file_content} # хеш для :attachments
else
  attachments = nil # если не нужно прикреплять
end

begin
Pony.mail({
              :subject => "Привет из программы на руби!",
              :body => body,
              :attachments => attachments, # я добавил
              :headers => { 'Content-Type' => 'text/html' }, # я добавил для поддержки HTML
              :to => send_to,
              :from => mailbox,
              :via => :smtp,
              :via_options => {
                  :address => 'smtp.yandex.ru',
                  :port => '465',
                  :tls => true,
                  :user_name => mailbox,
                  :password => password,
                  :authentication => :plain
              }
          })
puts 'вроде бы отправлено )'
rescue SocketError
  puts 'не могу соединиться'
rescue Net::SMTPAuthenticationError => error
  puts 'неверный пароль\n' + error.message
end
