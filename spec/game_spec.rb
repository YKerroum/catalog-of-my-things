require_relative '../classes/models/game'
require 'date'
require 'json'

describe Game do
  before(:each) do
    @game = Game.new(true, '2022-01-01', '2010-02-02')
  end

  it 'test initialize' do
    expect(@game.multiplayer).to eq(true)
    expect(@game.last_played_at).to eq(Date.parse('2022-01-01'))
    expect(@game.publish_date).to eq(Date.parse('2010-02-02'))
  end

  it 'test can_be_archived?' do
    expect(@game.send(:can_be_archived?)).to eq(false)

    @game.last_played_at = Date.today - 731
    @game.move_to_archive

    expect(@game.send(:can_be_archived?)).to eq(true)
  end

  it 'test to_json' do
    # Create a JSON object from the game instance and check the values of its properties are correct
    json = JSON.parse(@game.to_json)

    expect(json).to be_a(Hash)
    expect(json['id']).to be_a(Integer)
    expect(json['genre']).to eq(nil)
    expect(json['author']).to eq(nil)
    expect(json['label']).to eq(nil)
    expect(json['publish_date']).to eq('2010-02-02')
    expect(json['archived']).to eq(false)
    expect(json['multiplayer']).to eq(true)
    expect(json['last_played_at']).to eq('2022-01-01')
  end
end
