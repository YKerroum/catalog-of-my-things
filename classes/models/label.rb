require_relative 'item'
class Label
  private

  attr_accessor :id

  public

  attr_accessor :title, :color, :items

  def initialize(title, color, id = nil)
    @id = id || rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
