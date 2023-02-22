require_relative '../classes/models/musicalbum'
require 'rspec'
RSpec.describe MusicAlbum do
  describe 'test intitialization' do
    it 'check the on_spotify statut' do
      musicalbum = MusicAlbum.new('2021-02-23')
      expect(musicalbum.on_spotify).to eq(false)
    end
  end
  describe 'test the can_be_archive? method' do
    it 'can be archive the music album' do
      musicalbum = MusicAlbum.new('2009-01-23', on_spotify: true)
      result = musicalbum.can_be_archived?
      expect(result).to eq(true)
    end
  end
end
