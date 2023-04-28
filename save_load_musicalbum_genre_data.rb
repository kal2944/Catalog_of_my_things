class SaveLoadMusicAlbumData
  def initialize
    @music_albums = []
    @genres = []
  end

  def save_data(music_albums, genres)
    File.write('music_albums.json', JSON.pretty_generate(music_albums.map do |music_album|
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
                                                      items: genre.items
                                                    }
                                                  end))
  end

  def load_data
    music_albums = File.read('music_albums.json')
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
    parsed_genre = 'dasdas'
    { music_albums: @music_albums, genre: parsed_genre }
  end
end
