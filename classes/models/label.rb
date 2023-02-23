require_relative 'item'
require 'json'
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

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'title' => @title,
      'color' => @color
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['title'], object['color'], object['id'])
  end
end
