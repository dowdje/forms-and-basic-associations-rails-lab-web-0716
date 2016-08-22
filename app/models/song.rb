class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  attr_reader :artist_name, :genre_name



  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def note_contents=(array)
    # byebug
    array.collect do |note|
      unless note == ""
      self.notes << Note.create(:content => note)
    end
    end
  end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end

  def artist_named
    self.artist.name
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_named
    self.genre.name
  end
end

