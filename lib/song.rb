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
    song = self.new
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end
  
  def self.find_by_name(name)
    self.all.find{|person| person.name == name}
  end
  
  def self.find_or_create_by_name(name)
    result = self.find_by_name(name)
    if result
      result
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    sorted = self.all.sort_by{|song| song.name}
    sorted
  end
  
  def self.new_from_filename(filename)
    array = filename.split(" - ") # split the filename into an array
    array[1] = array[1].chomp(".mp3") # remove filetype
    song = self.new # create an instance
    # assign index 0 artist_name and index 1 name
    song.artist_name = array[0]
    song.name = array[1] 
    song
  end
  
  def self.create_from_filename(filename)
    result = self.new_from_filename(filename)
    song = self.create 
    song.name = result.name
    song.artist_name = result.artist_name
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
end