require_relative '../models/genre'
class GenreManager
  attr_accessor :labels

  def initialize
    @genres = []
  end

  def add_genre
    puts 'Enter genre name:'
    genre_name = gets.chomp
    genre = Genre.new(genre_name)
    @genres << genre
  end

  def all_genres
    if @genres.empty?
      puts 'No genre found in the catalog'
    else
      @genres.each do |_genre, index|
        puts "#{index + 1} -)  #{album.title}"
      end
      puts ''
    end
  end
end
