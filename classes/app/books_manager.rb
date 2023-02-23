require_relative '../models/book'
require_relative '../models/genre'
require_relative '../models/label'
require_relative '../models/author'

class BooksManager
  attr_accessor :books

  def initialize
    @books = []
  end

  def add_book(labels, authors, genres)
    puts 'Enter book publisher:'
    publisher = gets.chomp
    puts 'Enter book publish date:'
    publish_date = gets.chomp
    puts 'Enter book cover state:'
    cover_state = gets.chomp

    genre = genres.add_genre
    label = labels.add_label
    author = authors.add_author
    book = Book.new(publisher, cover_state, publish_date, genre, author, label)
    @books << book
    puts 'Book created successfully'
  end

  def all_books
    if @books.empty?
      puts 'No books in the catalog'
    else
      @books.each_with_index do |book, index|
        puts "#{index + 1}."
        puts "Author: #{book.author.first_name} #{book.author.last_name}"
        puts "Publisher: #{book.publisher}"
        puts "Publish date: #{book.publish_date}"
        puts "Genre: #{book.genre.name}"
        puts "Cover state: #{book.cover_state}"
        puts "Label: #{book.label.title}"
        puts "ID: #{book.id}"
        puts '-----------------------'
      end
    end
    @books
  end
end
