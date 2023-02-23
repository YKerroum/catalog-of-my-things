require_relative '../models/book'
require_relative '../models/genre'
require_relative '../models/game'

class GameManager
  attr_accessor :games

  def initialize
    @games = []
  end

  def add_game(labels, authors, genres)
    puts 'Is this game a multiplayer one ?[Y/N]:'
    multiplayer = gets.chomp.upcase
    multiplayer = %w[Y YES].include?(multiplayer)
    puts 'Enter the publish date:'
    publish_date = gets.chomp
    puts 'Enter the Last played date:'
    last_played = gets.chomp
    genre = genres.add_genre
    label = labels.add_label
    author = authors.add_author
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
        puts "Genre: #{game.genre.name}"
        puts "Label: #{game.label.title}"
        puts "Multiplayer: #{game.multiplayer}"
        puts '-----------------------'
        puts ''
      end
    end
  end
end
