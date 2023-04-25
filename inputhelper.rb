class InputHelper
  def self.title
    print 'Title: '
    gets.chomp.strip.capitalize
  end

  def self.author
    print 'Author: '
    gets.chomp.strip.capitalize
  end
end
