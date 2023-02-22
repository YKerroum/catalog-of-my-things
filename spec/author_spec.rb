require_relative '../classes/models/author'
require_relative '../classes/models/item'

describe Author do
  before(:each) do
    @author = Author.new('John', 'Doe', 1)
  end

  it 'test id is assigned correctly' do
    expect(@author.id).to eq(1)
  end

  it 'test add_item' do
    item = Item.new('2020-01-01')
    @author.add_item(item)

    expect(item.author).to eq(@author)
    expect(@author.items).to eq([item])
  end

  it 'test to_json' do
    expected = { JSON.create_id => 'Author', 'first_name' => 'John', 'last_name' => 'Doe', 'id' => @author.id }.to_json
    expect(expected).to eq(@author.to_json)
  end

  it 'test json_create' do
    json = { JSON.create_id => 'Author', 'first_name' => 'John', 'last_name' => 'Doe', id: 1 }.to_json

    author = Author.json_create(JSON.parse(json))

    expect(author).to be_an_instance_of(Author)
    expect(author.first_name).to eq('John')
    expect(author.last_name).to eq('Doe')
    expect(author.id).to eq(1)
  end
end
