require './app'

def run
  input_option = 0
  puts 'Welcome to School Library App!'
  app = App.new

  while input_option != 7
    app.diplay_menu
    input_option = gets.chomp.strip.to_i
    app.execute_option(input_option)
  end

  puts 'Thank you for using this app!'
  puts
end

def main
  run
end

main
