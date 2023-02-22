require_relative 'books_manager'
require_relative 'labels_manager'

class App
  def initialize
    @labels = LabelManager.new
    @books = BooksManager.new
    @albums = AlbumManager.new
    @books.books = Storage.load('books')
    @labels.labels = Storage.load('labels')
  end

  def display_menu
    puts '1. Add book'
    puts '2. Add music album'
    puts '3. Add game'
    puts '4. Display all books'
    puts '5. Display all music albums'
    puts '6. Display all labels'
    puts '7. Display all genres'
    puts '8. Display all games'
    puts '9. Dsiplay all authors'
    puts '10. Exit'
  end

  def action_controller
    choices = {
      1 => method(@books.add_book(@labels)),
      2 => method(@albums.add_album),
      3 => method(:add_game),
      4 => method(@books.all_books),
      5 => method(@albums.all_albums),
      6 => method(@labels.all_labels),
      7 => method(:display_genres),
      8 => method(:display_games),
      9 => method(:display_authors),
      10 => method(:exit)
    }
    loop do
      display_menu
      print 'Enter your choice: '
      choice = gets.chomp.to_i
      action = choices[choice] || raise("Invalid option: #{choice}")
      action.call
    end
  end

  def exit
    Storage.save('books', @books.books)
    Storage.save('labels', @labels.labels)
    exit
  end
end
