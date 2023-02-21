require_relative 'item'
class MusicAlbum < Item
  def initialize(genre, author, label, publish_date, on_spotify: false, id: nil) # rubocop:disable Metrics/ParameterLists
    super(genre, author, label, publish_date, id)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
