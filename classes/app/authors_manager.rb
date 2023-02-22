require_relative '../models/label'
class AuthorManager
  attr_accessor :authors

  def initialize
    @authors = []
  end

  def add_author
    puts 'Enter First name :  '
    first = gets.chomp
    puts 'Enter Last name :  '
    last = gets.chomp
    author = Author.new(first, last)
    @authors << author
  end

  def all_authors
    if @authors.empty?
      puts 'No author found in the catalog'
    else
      @authors.each do |author, index|
        puts "Author  #{index + 1}"
        puts "First Name : #{author.first_name}"
        puts "Last Name : #{album.last_name}"
        puts ''
      end
      puts ''
    end
  end
end
