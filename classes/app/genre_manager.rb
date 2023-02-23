require_relative '../models/genre'
class GenreManager
  attr_accessor :genres

  def initialize
    @genres = []
  end

  def add_genre
    puts 'Enter genre name:'
    genre_name = gets.chomp
    genre = Genre.new(genre_name)
    @genres << genre
    genre
  end

  def all_genres
    if @genres.empty?
      puts 'No genre found in the catalog'
    else
      @genres.each_with_index do |genre, index|
        puts "#{index + 1} -)  #{genre.name}"
      end
      puts ''
    end
  end
end
