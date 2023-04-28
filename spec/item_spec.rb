require_relative '../item'

describe Item do
  before(:each) do
    @item = Item.new('2018-09-10', archived: true)
  end

  it 'return a item object' do
    expect(@item).to be_an_instance_of(Item)
  end

  it 'return the correct publish_date date' do
    expect(@item.publish_date).to eq('2018-09-10')
  end

  it 'return the correct archived status' do
    expect(@item.archive).to eq(true)
  end

  it 'should not archive if publish_date is less than 10 years ago' do
    item = Item.new('2022-01-01')
    expect(item.move_to_archive).to eq(false)
    expect(item.archive).to eq(false)
  end
end
