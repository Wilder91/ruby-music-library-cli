
require "pry"
class Song 
    attr_accessor :name, :artist, :genre, :musicimporter, :musiclibrarycontroller
    extend Concerns::Findable
    @@all = []

   
    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist=(artist) if artist != nil
        self.genre=(genre) if genre != nil
    end

    def self.all 
        @@all
    end

    def self.destroy_all 
        @@all.clear 
    end


    def save 
        @@all << self
    end

    def self.create(name)
        new = Song.new(name)
        @@all << new 
        new
    end

    def artists
        #binding.pry
        @songs.include?(song.artist) ? nil : song.artist
    end

    def artist 
       @artist   
    end

    def artist=(artist)
        @artist = artist
        #binding.pry
        artist.add_song(self)
    end

   

    def genre 
        @genre 
    end

    def genre=(genre)
        @genre = genre 
        genre.songs << self unless genre.songs.include?(self)
    end

    def self.new_from_filename(filename)
        array = filename.split(" - ")
        s = array[1]
        a = array[0]
        g = array[2].chomp(".mp3")
        #binding.pry
        artist = Artist.find_or_create_by_name(a)
        genre = Genre.find_or_create_by_name(g)
        self.new(s, artist, genre)
        #self.new(song_name, artist_name, genre_name)
    end
    
    def self.create_from_filename(filename)
        self.new_from_filename(filename).save
    end
  

    
end