require_relative '../classes/models/genre'
require_relative '../classes/models/item'
describe Genre do
  describe 'testing class' do
    it 'should create a new genre' do
      genre = Genre.new('Zook Love')
      expect(genre.name).to eq('Zook Love')
    end

    it 'items of genre should be empty' do
      genre = Genre.new('RNB')
      expect(genre.items).to eq([])
    end

    it 'add an item' do
      item = Item.new('2023-02-21')
      genre = Genre.new('relaxant', id: 10)
      genre.add_item(item)
      expect(genre.items).to include(item)
    end
  end
end