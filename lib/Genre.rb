require "pry"
class Genre 
    attr_accessor :name 
    @@all = []
    extend Concerns::Findable

    def initialize(name)
        @name = name 
        @songs = []
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

    def self.create(genre)
        genre = self.new(genre)
        genre.save
        genre
    end

    def songs
        @songs
    end

    def artists
        @g_songs = []
        @songs.each do |song|
        if @g_songs.include?(song.artist)
            nil
        else
            @g_songs << song.artist
        end
    end
    @g_songs
    
    end

end