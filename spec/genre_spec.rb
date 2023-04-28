require_relative '../genre'
require_relative '../music_album'

describe Genre do
  before(:each) do
    @genre = Genre.new('Blues')
    @music_album = MusicAlbum.new('2022-10-22', false, archived: true)
    @genre.add_item(@music_album)
  end

  it 'return a genre object' do
    expect(@genre).to be_an_instance_of(Genre)
  end

  it 'return the correct name' do
    expect(@genre.name).to eq('Blues')
  end

  it 'adds a game to the items array' do
    expect(@genre.items).to include(@music_album)
  end
end
