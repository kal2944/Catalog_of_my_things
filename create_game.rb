class GameFunc
  def initialize
    @games = []
    @authors = []
  end

  def create_game
    publish_dates = publish_date
    print 'Multiplayer: '
    multiplayer = gets.chomp
    last_played = last_played_at
    print 'archived_status [Y/N]: '
    archived = gets.chomp.upcase
    if %w[Y N].include?(archived)
      if archived == 'Y'
        archived = true
      elsif archived == 'N'
        archived = false
      end
      @game = Game.new(publish_dates, multiplayer, last_played, archived: archived)
      @games << @game
    else
      print "Invalid option type Y or N\n"
      nil
    end
    @games
  end

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
    author = Author.new(first_name, last_name)
    author.add_item(@game)
    puts author.inspect
    @authors << author
    @authors
  end
end
