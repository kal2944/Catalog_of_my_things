require 'date'

class Item
  attr_accessor :id, :genre, :author, :source, :labels, :archive, :publish_date

  def initialize(publish_date, archived: false)
    @id = Random.rand(1...1000)
    @publish_date = publish_date
    @archive = archived
    @labels ||= []
    @author ||= []
  end

  def move_to_archive
    return false unless can_be_archived?

    @archive = true
    true
  end

  private

  def can_be_archived?
    return true if Date.parse(@publish_date) < Date.today.prev_year(10)
  end
end
