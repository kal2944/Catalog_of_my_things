class MusicAlbumfunc
  def publish_date
    print "write publish_date in this format  (i.e.,2022-04-9) \nPublish_date: "
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
end
