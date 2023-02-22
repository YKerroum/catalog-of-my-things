require_relative 'item'
require 'json'
require 'date'

class Game < Item
  attr_accessor :platform, :multiplayer

  def initialize(multiplayer, last_played, publish_date, genre = nil, author = nil, label = nil, id = nil) # rubocop:disable Metrics/ParameterLists
    super(publish_date, genre, author, label, id)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played)
  end

  private

  def can_be_archived?
    super && (Date.today - @last_played_at) > 730
  end
end
