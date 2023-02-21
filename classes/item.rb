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
    @publish_date = publish_date
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
    @archived = true
  end

  public

  def move_to_archive
    can_be_archived?
  end
end
