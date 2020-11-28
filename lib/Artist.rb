class Artist 
    attr_accessor :name, :genre
    extend Concerns::Findable

    @@all = []
    
    def initialize(name)
        @name = name 
        @songs = []
        @genre = genre
    end

    def artist 
        @artist 
    end

    def self.all 
        @@all 
    end

    def self.destroy_all 
        @@all.clear 
    end

    def save 
        @@all << self
        #binding.pry
    end 

    def self.create(name)
        new = Artist.new(name)
        @@all << new 
        new
    end

    def songs 
        #binding.pry
        @songs 
    end

    def add_song(song) 
        #binding.pry
        if song.artist == nil
            song.artist = self 
        else
            nil
        end
        @songs.include?(song) ? nil : @songs << song
    end

    def genres
        @tunes = []
        @songs.each do |song|
          if @tunes.include?(song.genre)
            nil
          else
            @tunes << song.genre
          end
        end
        @tunes
    end

    

end