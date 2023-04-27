class GameFunc
  def publish_date
    print "Create a game\n"
    print "write publish_date (yyyy-mm-dd) \nPublish_date: "
    publish_date = gets.chomp
    if (publish_date.to_i.to_s == publish_date) || begin
      Date.parse(publish_date)
    rescue StandardError
      nil
    end.nil?
      puts 'invalid date'
      nil
    end
    publish_date
  end

  def last_played_at
    print "write last_played_at date (yyyy-mm-dd) \nLast_played_at: "
    last_played_at = gets.chomp
    if (last_played_at.to_i.to_s == last_played_at) || begin
      Date.parse(last_played_at)
    rescue StandardError
      nil
    end.nil?
      puts 'invalid date'
      nil
    end
    last_played_at
  end

  def create_author
    print "Add author to the Game\n"
    print 'First_name: '
    first_name = gets.chomp
    print 'Last_name: '
    last_name = gets.chomp
    Author.new(first_name, last_name)
  end
end
