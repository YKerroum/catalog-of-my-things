class Author
  attr_reader :id, :items
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name, id = nil)
    @id = id || Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self unless item.author == self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'first_name' => @first_name,
      'last_name' => @last_name,
      'id' => @id
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['first_name'], object['last_name'], object['id'])
  end
end
