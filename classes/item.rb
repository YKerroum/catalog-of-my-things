class Item
  private
  attr_accessor :id, :archived

  public
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(id, genre, author, source, label, publish_date, archived)
    @id = id
  end

  def genre=(genre)
    @genre = genre
  end

  def author=(author)
    @author = author
  end

  def source=(source)
    @source = source
  end

  def label=(label)
    @label = label
  end

  private
  def can_be_archived?
    @archived = true
  end

  
end
