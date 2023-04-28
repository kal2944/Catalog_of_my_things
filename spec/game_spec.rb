require_relative '../game'

describe Game do
  before(:each) do
    @game = Game.new('2018-09-10', '3 vs 3', '2021-12-12', archived: true)
  end

  it 'return a game object' do
    expect(@game).to be_an_instance_of(Game)
  end

  it 'return the correct publish_date date' do
    expect(@game.publish_date).to eq('2018-09-10')
  end

  it 'return the correct multiplayer name' do
    expect(@game.multiplayer).to eq('3 vs 3')
  end

  it 'return the correct last_played_at date' do
    expect(@game.last_played_at.to_s).to eq('2021-12-12')
  end

  it 'return the correct archived status' do
    expect(@game.archive).to eq(true)
  end
end
