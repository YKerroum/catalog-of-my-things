require_relative '../models/label'
class AuthorManager
  attr_accessor :authors

  def initialize
    @authors = []
  end

  def add_author
    puts 'Enter Author\'s First name :  '
    first = gets.chomp
    puts 'Enter Author\'s Last name :  '
    last = gets.chomp
    author = Author.new(first, last)
    @authors << author
    author
  end

  def all_authors
    if @authors.empty?
      puts 'No author found in the catalog'
    else
      @authors.each_with_index do |author, index|
        print "#{index + 1} -)"
        puts " #{author.first_name} #{author.last_name} "
        puts ''
      end
      puts ''
    end
  end
end
