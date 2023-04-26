class GameFunc
  def publish_date
    print "write publish_date (i.e.,2022-04-27) \nPublish_date: "
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
    print "write last_played_at date (i.e.,2022-04-27) \nLast_played_at: "
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
end
