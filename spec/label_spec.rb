require_relative '../classes/models/label'
require_relative '../classes/models/item'

describe Label do
  it 'test initialize with title and_color' do
    label = Label.new('Groceries', 'red')
    expect(label.title).to eq('Groceries')
    expect(label.color).to eq('red')
  end

  it 'test label to be instance of Label' do
    label = Label.new('Groceries', 'red', 1)
    expect(label).to be_instance_of(Label)
  end

  it 'test adds item' do
    label = Label.new('Groceries', 'red')
    item = Item.new('2023-02-21')

    label.add_item(item)

    expect(label.items).to include(item)
    expect(item.label).to eq(label)
  end
end
