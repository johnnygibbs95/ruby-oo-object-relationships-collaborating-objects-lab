class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file)
        arr = file.split('.mp3')[0].split(' - ')
        artist = arr[0] 
        name = arr[1]
        genre = arr[2]
        song = Song.new(name)
        song.artist = Artist.find_or_create_by_name(artist)
        song
    end

    def artist_name=(artist_name)
        artist = Artist.find_or_create_by_name(artist_name)
        self.artist = artist
    end

end