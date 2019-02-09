require 'pry'

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

  def Song.new_by_name(name)
    song = self.new
    song.name = name
    song 
  end

  def Song.create_by_name(name)
    song = self.new
    song.name = name 
    @@all << song
    song
  end

  def Song.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def Song.find_or_create_by_name(name)
    song = Song.find_by_name(name)
    
    if song == nil
      Song.create_by_name(name)
    elsif song.name == name
      song
    end
  end
  
  def Song.alphabetical
    @@all.sort_by {|song| song.name}
  end
  
  def Song.new_from_filename(filename)
    song_arr = filename.split(" - ")
    song_arr[-1] = song_arr[-1].split(".")[0]
    song_name = song_arr[-1]
    artist_name = song_arr[0]
    song = Song.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  
  def Song.create_from_filename(filename)
    song_arr = filename.split(" - ")
    song_arr[-1] = song_arr[-1].split(".")[0]
    song_name = song_arr[-1]
    artist_name = song_arr[0]
    song = Song.new
    song.name = song_name
    song.artist_name = artist_name
    @@all << song 
    song
  end 

  def Song.destroy_all
    @@all.clear
  end
end

