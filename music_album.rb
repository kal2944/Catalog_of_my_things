require 'date'
require_relative 'item'

class MusicAlbum < Item
  attr_reader :publish_date, :on_spotify, :archived

  def initialize(publish_date, on_spotify, archived: false)
    super(publish_date, archived: archived)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && (@on_spotify == false)
  end
end
