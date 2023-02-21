
class Label
  private
    attr_accessor :id, items
  public
    attr_accessor :title, :color
  def initialize(title, color)
    @id = rand(1..1000)
    @title = title
    @color = color
    @items = []
  end
end
