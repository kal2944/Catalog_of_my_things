require_relative 'item'

class Genre
  attr_accessor :name

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.genre = self
  end
end
