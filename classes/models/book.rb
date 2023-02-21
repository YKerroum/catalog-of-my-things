require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(genre, author, label, publish_date, publisher, cover_state) # rubocop:disable Metrics/ParameterLists
    super(genre, author, label, publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    can_be_archived? || @cover_state == 'bad'
  end
end