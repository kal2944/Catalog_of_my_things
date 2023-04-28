class BookFunc
  def initialize
    @books = []
    @labels = []
  end

  def publisher
    print 'Enter publisher: '
    gets.chomp
  end

  def cover_state
    print 'Enter cover state: '
    gets.chomp
  end

  def publish_date
    print 'Enter publish date (yyyy-mm-dd): '
    publish_date_str = gets.chomp
    Date.parse(publish_date_str)
  rescue ArgumentError
    puts 'Invalid date format. Please enter date in yyyy-mm-dd format.'
  end

  def archived_status
    print 'archived_status [Y/N]: '
    archived = gets.chomp.upcase
    if %w[Y N].include?(archived)
      archived == 'Y'
    else
      print "Invalid option type Y or N\n"
      nil
    end
  end

  def create_book
    publisher = publisher()
    cover_state = cover_state()
    publish_date = publish_date()
    archived = archived_status
    return @books if archived.nil?

    @book = Book.new(publisher, cover_state, publish_date, archived: archived)
    @books << @book
    @books
  end

  def create_label
    print "create label for book\n"
    print 'Enter title: '
    title = gets.chomp
    print 'Enter color: '
    color = gets.chomp
    label = Label.new(title, color)
    label.add_item(@book)
    @labels << label
    @labels
  end
end
