class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end
  def self.create
    song = self.new
    song.save
    song
  end
  def self.destroy_all
    @@all.clear
  end
  def self.new_by_name(name)
    song = self.new
    song.name = name 
    song 
  end
  def self.create_by_name(name)
    song = self.new
    song.name = name 
    song.save
    song
  end
  
  def self.alphabetical
    self.all.sort_by {|x| x.name}
  end 
  def self.find_by_name(name)
    @@all.detect {|i| i.name == name}
  end
  def self.find_or_create_by_name(name)
    found_it = self.find_by_name(name)
    if found_it == nil
      self.create_by_name(name)
    else
      found_it
    end
  end
  def self.new_from_filename(new_file)
    file = self.new 
    file.name = new_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    file.artist_name = new_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    file
  end 
  def self.create_from_filename(new_file)
    file = self.new 
    file.name = new_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    file.artist_name = new_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    file.save
    file
  end
end
