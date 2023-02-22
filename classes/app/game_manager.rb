require_relative '../models/book'
require_relative '../models/genre'

class GameManager
  attr_accessor :games

  def initialize
    @games = []
  end

  def add_game(labels)
    puts 'Is this game a multiplayer one ?[Y/N]:'
    multiplayer = gets.chomp.upcase
    puts 'Enter the publish date:'
    publish_date = gets.chomp
    puts 'Enter the Last played date:'
    last_played = gets.chomp
    puts 'Enter author Firstname:'
    author_first = gets.chomp
    puts 'Enter author Lastname:'
    author_last = gets.chomp
    author = Author.new(author_first, author_last)
    puts 'Enter Album  genre:'
    genre_title = gets.chomp
    genre = Genre.new(genre_title)
    puts 'Enter the Label Name :'
    label_name = gets.chomp
    puts 'Enter the Label Color:'
    label_color = gets.chomp
    label = Label.new(label_name, label_color)
    game = Game.new(multiplayer, last_played, publish_date, genre, author, label)
    @games << game
    puts 'Album created successfully'
  end

  def all_games
    if @games.empty?
      puts 'No books in the catalog'
    else
      @games.each_with_index do |game, index|
        puts "Game N°#{index + 1}"
        puts "ID: #{game.id}"
        puts "Author: #{game.author.first_name} #{game.author.last_name}"
        puts "Publish date: #{game.publish_date}"
        puts "Last Played Date: #{game.last_played_at}"
        puts "Genre: #{game.genre}"
        puts "Label: #{game.label.title}  #{game.label.color}"
        puts "Multiplayer: #{game.multiplayer}"
        puts '-----------------------'
        puts ''
      end
    end
    @books
  end
end
