require './ruby-password'

def handle_password( pw )
  pw.check
  puts pw.crypt( `uname` == "Linux\n" ? Password::MD5 : Password::DES )
end

begin
  my_string = Password.get( "Password with get: " )
  handle_password( my_string )
rescue Password::WeakPassword => reason
  puts reason
  retry
end

begin
  my_string = Password.getc( "Password with getc: ", 'X' )
  handle_password( my_string )
rescue Password::WeakPassword => reason
  puts reason
  retry
end