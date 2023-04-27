require_relative 'item'
require_relative 'book'
require_relative 'label'

class BookFunc
  def create_book
    print 'Enter publisher: '
    publisher = gets.chomp
    print 'Enter cover state: '
    cover_state = gets.chomp
    print 'Enter ID: '
    id = gets.chomp
    print 'Enter publish date (yyyy-mm-dd): '
    publish_date_str = gets.chomp
    begin
      publish_date = Date.parse(publish_date_str)
      Book.new(publisher, cover_state, id, publish_date)
    rescue ArgumentError
      puts 'Invalid date format. Please enter date in yyyy-mm-dd format.'
    end
  end

  def create_label
    print 'Enter ID: '
    id = gets.chomp
    print 'Enter title: '
    title = gets.chomp
    print 'Enter color: '
    color = gets.chomp
    Label.new(id, title, color)
  end

  def add_book_to_label
    print 'Enter book ID: '
    book_id = gets.chomp
    print 'Enter label ID: '
    label_id = gets.chomp
    book = Item.find(book_id)
    label = Label.find(label_id)
    if book.nil?
      puts 'Book not found.'
    elsif label.nil?
      puts 'Label not found.'
    else
      label.add_item(book)
      puts 'Book added to label.'
    end
  end
end
