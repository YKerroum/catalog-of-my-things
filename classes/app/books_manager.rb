require_relative '../models/book'
require_relative '../models/genre'

class BooksManager
  def initialize
    @books = []
  end

  def add_book(labels)
    puts 'Enter book publisher:'
    publisher = gets.chomp
    puts 'Enter book publish date:'
    publish_date = gets.chomp
    puts 'Enter book genre:'
    genre_title = gets.chomp
    genre = Genre.new(genre_title)
    puts 'Enter book cover state:'
    cover_state = gets.chomp
    label = labels.add_label
    book = Book.new(publisher, cover_state, publish_date, genre, nil, label)
    @books << book
    puts 'Book created successfully'
  end

  def all_books
    if @books.empty?
      puts 'No books in the catalog'
    else
      @books.each_with_index do |book, index|
        puts "#{index + 1}. #{book.title}"
        puts "Author: #{book.author}"
        puts "Publisher: #{book.publisher}"
        puts "Publish date: #{book.publish_date}"
        puts "Genre: #{book.genre}"
        puts "Cover state: #{book.cover_state}"
        puts "Label: #{book.label}"
        puts "ID: #{book.id}"
        puts '-----------------------'
      end
    end
    @books
  end
end
