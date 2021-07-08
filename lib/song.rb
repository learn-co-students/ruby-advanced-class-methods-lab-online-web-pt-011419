class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  
  
 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

def self.create
  @@all << self 
end 

 def self.create 
    #instantiate a song
    #save
    #return new song
    song = self.new 
    song.save
    song 
  end 
  
  def self.new_by_name(name) #a string of the song method
    #instantiate a song
    #creates a name property 
    # return new song 
    song = self.new
    song.name = name 
    song
  end 
  
  def self.create_by_name(song_name)
    song = self.create 
    song.name = song_name 
    song 
  end 
  
  def self.find_by_name(song_name)
    @@all.find {|song|song.name == song_name}
  end 
  
  def self.find_or_create_by_name(song_name)
    #find the song by name or create song by name 
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end 
  
  def self.alphabetical
    #iterate over @@all array, we are iterating over our song objects, we than have to call the song object property name. 
    @@all.sort_by{|song_name| song_name.name}
  end 
  
  def self.new_from_filename(filename)
    info = filename.split(" - ")
    song = self.new #created a new song object 
    song.name = info[1].chomp(".mp3") #set the name of this song = name of the song file and removed .mp3
    song.artist_name = info[0] #parse the filename for song name and artist name
    song 
    
    
    #filename = "Taylor Swift - Blank Space.mp3"
    #return a new song instance 
    #set song name to name of song "blank space"
    #set artist_name to name of artist "Taylor Swift"
    #parse the filename for song name and artist name
    #separate artist name at - 
    #remove the .mp3 from song name 
  end 
  
  def self.create_from_filename(filename)
    #filename = "Taylor Swift - Blank Space.mp3"
    info = filename.split(" - ")
    song = self.create 
    song.name = info[1].chomp(".mp3") 
    song.artist_name = info[0] 
    song 
  end 
  
  def self.destroy_all
    @@all.clear 
  end 
end
