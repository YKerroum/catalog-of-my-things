require_relative 'item'
class MusicAlbum < Item
  attr_reader :id
  attr_accessor :on_spotify

  def initialize(publish_date, genre = nil, author = nil, label = nil, id = nil, on_spotify = false) # rubocop:disable Metrics/ParameterLists, Style/OptionalBooleanParameter
    super(publish_date, genre, author, label, id)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'publish_date' => @publish_date,
      'on_spotify' => @on_spotify,
      'genre' => @genre,
      'label' => @label,
      'author' => @author,
      'id' => @id
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['publish_date'],
        object['genre'],
        object['author'],
        object['label'],
        object['id'],
        object['on_spotify'])
  end
end
