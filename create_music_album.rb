class MusicAlbumFunc
  def initialize
    @music_albums = []
    @genres = []
  end

  def sportify
    print 'On_spotify [Y/N]: '
    on_spotify = gets.chomp.upcase
    if %w[Y N].include?(on_spotify)
      if on_spotify == 'Y'
        on_spotify = true
      elsif on_spotify == 'N'
        on_spotify = false
      end
    end
    on_spotify
  end

  def create_album
    publish_dates = publish_date
    on_spotify = sportify
    print 'archved status [Y/N]: '
    archived = gets.chomp.upcase
    if %w[Y N].include?(archived)
      if archived == 'Y'
        archived = true
      elsif archived == 'N'
        archived = false
      end
      @music_album = MusicAlbum.new(publish_dates, on_spotify, archived: archived)
      @music_albums << @music_album
    else
      print "Invalid option type Y or N\n"
      nil
    end
    @music_albums
  end

  def publish_date
    print "write publish_date in this format  (yyyy-mm-dd) \nPublish_date: "
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

  def create_genre
    print "Add genre to the MusicAlbum\n"
    print 'Name: '
    name = gets.chomp
    genre = Genre.new(name)
    genre.add_item(@music_album)
    puts "Genre #{name} added to the MusicAlbum"
    @genres << genre
    @genres
  end
end
