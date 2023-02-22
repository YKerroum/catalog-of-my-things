class Genre
  attr_reader :id
  attr_accessor :name, :items

  def initialize(name, id: nil)
    @id = id || Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = self unless item.genre == self
    @items << item
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'name' => @genre,
      'id' => @id
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['name'], object['id'])
  end
end
