require_relative 'item'
class MusicAlbum < Item
  def initialize(publish_date, genre = nil, author = nil, label = nil, id = nil, on_spotify: false) # rubocop:disable Metrics/ParameterLists
    super( publish_date, genre, author, label, id)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
