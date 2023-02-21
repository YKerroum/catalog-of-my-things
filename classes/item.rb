require 'date'
require 'time'

class Item
  private

  attr_accessor :id, :archived

  public

  attr_accessor :publish_date

  def initialize(genre, author, label, publish_date = Time.now.to_d)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @label = label
    @publish_date = Date.parse(publish_date)
    @archived = false
  end

  def genre=(genre)
    @genre = genre
    genre.add_item(self)
  end

  def author=(author)
    @author = author
    author.add_item(self)
  end

  def label=(label)
    @label = label
    label.add_item(self)
  end

  private

  def can_be_archived?
    current_date = Date.now
    (current_date.year - @publish_date.year) > 10
  end

  public

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
