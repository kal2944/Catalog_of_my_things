class SaveLoadMusicAlbumData
  def initialize
    @music_albums = []
    @genres = []
  end

  def save_data(music_albums, genres)
    File.write('music_album.json', JSON.pretty_generate(music_albums.map do |music_album|
      {
        id: music_album.id,
        publish_date: music_album.publish_date,
        on_spotify: music_album.on_spotify,
        archived: music_album.archive
      }
    end))
    File.write('genre.json', JSON.pretty_generate(genres.map do |genre|
      {
        id: genre.id,
        name: genre.name,
        items: genre.items.map do |item|
          { id: item.id }
        end
      }
    end))
  end

  def load_data
    load_music_albums
    load_genres
    { music_albums: @music_albums, genres: @genres }
  end

  def load_music_albums
    music_albums = File.read('music_album.json')
    parsed_music_albums = JSON.parse(music_albums)
    parsed_music_albums.each do |music_album_data|
      music_album = MusicAlbum.new(
        music_album_data['publish_date'],
        music_album_data['on_spotify'],
        archived: music_album_data['archived']
      )
      music_album.instance_variable_set(:@id, music_album_data['id'])
      @music_albums << music_album
    end
  end

  def load_genres
    genre = File.read('genre.json')
    parsed_genre = JSON.parse(genre)
    parsed_genre.each do |genre_data|
      genre = Genre.new(
        genre_data['name']
      )
      genre.instance_variable_set(:@id, genre_data['id'])
      find_music_album = nil
      @music_albums.each do |music_album|
        if music_album.id == genre_data['items'][0]['id']
          find_music_album = music_album
          break
        end
      end
      puts "Genre #{genre.name} has no music album" unless find_music_album
      genre.add_item(find_music_album) if find_music_album
      @genres << genre
    end
  end
end
