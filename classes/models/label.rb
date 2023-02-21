require_relative 'item'
class Label
  private

  attr_accessor :id, items

  public

  attr_accessor :title, :color

  def initialize(title, color, id = nil)
    @id = id || rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end
end
