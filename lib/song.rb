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
# Aysan - How to refactor to one line.
    song = self.new
    self.all << song
    song
  end
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create_by_name(name)
  end
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  def self.new_from_filename(name)
    name_split = name.split(" - ")
    artist = name_split[0]
    title = name_split[1]
    title.slice!(-4,4)

    song = self.new
    song.artist_name = artist
    song.name = title
    song
  end
  def self.create_from_filename(name)
    name_split = name.split(" - ")
    artist = name_split[0]
    title = name_split[1]
    title.slice!(-4,4)

    song = self.new
    song.artist_name = artist
    song.name = title
    self.all << song
    song
  end
  def self.destroy_all
      self.all.clear
  end
end
