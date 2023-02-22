require_relative '../models/musicalbum'
require_relative '../models/label'
require_relative '../models/genre'

class AlbumManager
  attr_accessor :albums

  def initialize
    @albums = []
  end

  def add_album()
    puts 'Is this music available on Spotify?[Y/N]:'
    on_spotify = gets.chomp.upcase
    puts 'Enter Album publish date:'
    publish_date = gets.chomp
    puts 'Enter Album  Author:'
    author = gets.chomp
    puts 'Enter Album  genre:'
    genre_title = gets.chomp
    genre = Genre.new(genre_title)
    puts 'Enter the Label Name :'
    label_name = gets.chomp
    puts 'Enter the Label Color:'
    label_color = gets.chomp
    label = Label.new(label_name, label_color)
    album = MusicAlbum.new(publish_date, on_spotify: on_spotify, genre: genre, label: label, author: author)
    @albums << album
    puts 'Album created successfully'
  end

  def all_albums
    if @albums.empty?
      puts 'No Music Album found in the catalog'
    else
      @albums.each_with_index do |album, index|
        puts "#{index + 1}. #{album.title}"
        puts "ID: #{album.id}"
        puts "Author: #{album.author}"
        puts "Publish date: #{album.publish_date}"
        puts "Genre: #{album.genre}"
        puts "Label: #{album.label.name}"
        puts "Publisher: #{album.publisher}"
        puts "On Spotify: #{book.on_spotify}"
        puts "Archived: #{book.can_be_archived?}"
        puts '-----------------------'
      end
    end
  end
end
