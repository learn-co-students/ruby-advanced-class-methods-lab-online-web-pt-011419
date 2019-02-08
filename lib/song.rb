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
    song = self.new  #instantiates song 
    song.save        #saves the song 
    song             #returns song
  end

  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name
    song
  end 

  def self.create_by_name(song_name)
    song = self.create 
    song.name = song_name
    song
  end 
  
  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end 
  
  def self.alphabetical 
    self.all.sort_by {|song| song.name}
  end 
  
  def self.new_from_filename(filename)
    info = filename.split(" - ")
    song = self.new       #created a new song object
    #set to name of this song = name of song in file
    song.name = info[1].chomp(".mp3")
    song.artist_name = info[0]
    song
  end
  
  def self.create_from_filename(filename)
    info = filename.split(" - ")
    song = self.create   
    song.name = info[1].chomp(".mp3")
    song.artist_name = info[0]
    song
  end
  
  def self.destroy_all 
    self.all.clear
  end
  
end
