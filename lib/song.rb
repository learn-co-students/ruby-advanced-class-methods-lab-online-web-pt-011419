require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create 
    new_song = self.new
    @@all << new_song
    new_song
  end
  
  def Song.new_by_name (name)
    new_song = self.new
    new_song.name = name
    new_song
  end
  
  def Song.create_by_name (name)
    new_song=self.new
    @@all<< new_song
    new_song.name=name
    new_song
  end
  
  def Song.find_by_name (name)
    @@all.find{|song| song.name == name}
  end

  def Song.find_or_create_by_name (name)
   self.find_by_name(name) || self.create_by_name(name)
  end
  
  def Song.alphabetical
    @@all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(file_name)
    new_song = self.new
    new_song.name = file_name.split(" - ")[1].split(".")[0]
    new_song.artist_name = file_name.split(" - ")[0]
    new_song
  end
  def Song.create_from_filename (file_name)
    new_song = self.new
    new_song.name = file_name.split(" - ")[1].split(".")[0]
    new_song.artist_name = file_name.split(" - ")[0]
    @@all<< new_song
    new_song
  end
  
  def Song.destroy_all
    @@all.clear
  end
  
  
end

