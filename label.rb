require_relative 'item'

class Label
  attr_accessor :title, :color, :items, :id

  def initialize(title, color)
    @id = Random.rand(1...1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    item.labels << self
    @items << item
  end
end
