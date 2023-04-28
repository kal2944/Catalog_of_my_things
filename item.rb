require 'date'

class Item
  attr_accessor :id, :genre, :author, :source, :labels, :archive

  def initialize(publish_date, archived: false)
    @id = Random.rand(1...1000)
    @publish_date = publish_date
    @archive = archived
    @labels ||= []
  end

  def move_to_archive
    @archive = true if can_be_archived?
  end

  private

  def can_be_archived?
    return true if @publish_date < Date.today.prev_year(10)
  end
end
