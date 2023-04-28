require_relative '../author'
require_relative '../game'

describe Author do
  before(:each) do
    @game = Game.new('2018-09-10', '3 vs 3', '2021-12-12', archived: true)
    @author = Author.new('huzaifa', 'khan')
    @author.add_item(@game)
  end

  it 'return a author object' do
    expect(@author).to be_an_instance_of(Author)
  end

  it 'return the correct first_name date' do
    expect(@author.first_name).to eq('huzaifa')
  end

  it 'return the correct last_name name' do
    expect(@author.last_name).to eq('khan')
  end

  it 'adds a game to the items array' do
    expect(@author.items).to include(@game)
  end
end
