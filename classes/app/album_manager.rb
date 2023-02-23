require_relative '../models/musicalbum'
require_relative '../models/label'
require_relative '../models/genre'

class AlbumManager
  attr_accessor :albums

  def initialize
    @albums = []
  end

  def add_album(labels, authors, genres)
    puts 'Is this music available on Spotify?[Y/N]:'
    on_spotify = gets.chomp.upcase
    on_spotify = %w[Y YES].include?(on_spotify)
    puts 'Enter Album publish date:'
    publish_date = gets.chomp
    genre = genres.add_genre
    label = labels.add_label
    author = authors.add_author
    album = MusicAlbum.new(publish_date, genre, author, label, nil, on_spotify)
    @albums << album
    puts 'Album created successfully'
  end

  def all_albums
    if @albums.empty?
      puts 'No Music Album found in the catalog'
    else
      @albums.each_with_index do |album, index|
        puts "Album number #{index + 1}."
        puts "ID: #{album.id}"
        puts "Author: #{album.author.first_name} #{album.author.last_name}"
        puts "Publish date: #{album.publish_date}"
        puts "Genre: #{album.genre.name}"
        puts "Label: #{album.label.title}"
        puts "On Spotify: #{album.on_spotify}"
        puts '-----------------------'
      end
    end
  end
end
