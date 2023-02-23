require_relative 'books_manager'
require_relative 'labels_manager'
require_relative 'album_manager'
require_relative 'genre_manager'
require_relative 'game_manager'
require_relative 'authors_manager'
require_relative 'storage'

class App
  def initialize
    @labels = LabelManager.new
    @books = BooksManager.new
    @albums = AlbumManager.new
    @genres = GenreManager.new
    @games = GameManager.new
    @authors = AuthorManager.new
    @books.books = Storage.load('books')
    @labels.labels = Storage.load('labels')
    @albums.albums = Storage.load('albums')
    @genres.genres = Storage.load('genres')
    @games.games = Storage.load('games')
    @authors.authors = Storage.load('authors')
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
      1 => -> { @books.add_book(@labels, @authors, @genres) },
      2 => -> { @albums.add_album(@labels, @authors, @genres) },
      3 => -> { @games.add_game(@labels, @authors, @genres) },
      4 => -> { @books.all_books },
      5 => -> { @albums.all_albums },
      6 => -> { @labels.all_labels },
      7 => -> { @genres.all_genres },
      8 => -> { @games.all_games },
      9 => -> { @authors.all_authors },
      10 => -> { exit }
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
    Storage.save('albums', @albums.albums)
    Storage.save('genres', @genres.genres)
    Storage.save('games', @games.games)
    Storage.save('authors', @authors.authors)
    puts 'Goodbye!'
    super
  end
end
