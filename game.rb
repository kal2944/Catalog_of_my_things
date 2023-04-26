require 'date'
require_relative 'item'

class Game < Item
  attr_reader :publish_date, :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at, archived: false)
    super(publish_date, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  private

  def can_be_archived?
    super && (@last_played_at < Date.today.prev_year(2))
  end
end
