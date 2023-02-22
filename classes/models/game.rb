require_relative 'item'
require 'json'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played, publish_date, genre = nil, author = nil, label = nil, id = nil) # rubocop:disable Metrics/ParameterLists
    super(publish_date, genre, author, label, id)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played)
  end

  private

  def can_be_archived?
    super && (Date.today - @last_played_at) > 730
  end

  public

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'genre' => @genre,
      'author' => @author,
      'label' => @label,
      'publish_date' => @publish_date,
      'archived' => @archived,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['multiplayer'], object['last_played_at'], object['publish_date'], object['genre'], object['author'],
        object['label'], object['id'])
  end
end
