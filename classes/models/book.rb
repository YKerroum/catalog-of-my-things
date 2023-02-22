require_relative 'item'
require 'json'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date, genre = nil, author = nil, label = nil, id = nil) # rubocop:disable Metrics/ParameterLists
    super(publish_date, genre, author, label, id)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  public

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'publisher' => @publisher,
      'cover_state' => @cover_state,
      'publish_date' => @publish_date,
      'genre' => @genre,
      'author' => @author,
      'label' => @label,
      'id' => @id
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['publisher'], object['cover_state'], object['publish_date'], object['genre'], object['author'],
        object['label'], object['id'])
  end
end
