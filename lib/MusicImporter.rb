class MusicImporter 

    def initialize(path)
        @path = path
    end

    def path 
        @path 
    end

    def files 
        #binding.pry
        Dir.entries(path).select! {|i| i.end_with?(".mp3")}
    end

    def import
        self.files.each {|f| Song.create_from_filename(f)}
        
    end 

        
 


end