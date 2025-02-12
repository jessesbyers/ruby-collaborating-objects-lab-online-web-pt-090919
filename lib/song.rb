class Song
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def artist=(artist)
    @artist = artist
  end

  def artist
    @artist
  end

  def self.all
    @@all
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    self.artist.add_song(self)
  end

  def self.new_by_filename(filename)
    song_name = filename.split(" - ").to_a[1]
    artist = filename.split(" - ").to_a[0]
    song = self.new(song_name)
    song.artist_name = artist
    song
  end
end
