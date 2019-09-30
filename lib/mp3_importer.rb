class MP3Importer
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(path).keep_if {|f| f.include?(".mp3")}
  end

  def import
    files.each {|f| Song.new_by_filename(f)}
  end
end
