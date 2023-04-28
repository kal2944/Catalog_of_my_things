require_relative '../music_album'

describe MusicAlbum do
    before(:each) do
        @music_album = MusicAlbum.new('2022-10-22', false, archived: true)
    end

    it 'return the correct publish_date date' do
        expect(@music_album.publish_date).to eq('2018-09-10')
    end
    
    it 'return a music album object' do
        expect(@music_album).to be_an_instance_of(MusicAlbum)
    end
    
    it 'return the correct on_spotify status' do
        expect(@music_album.on_spotify).to eq(false)
    end
    
    it 'return the correct archived status' do
        expect(@music_album.archive).to eq(true)
    end

end
