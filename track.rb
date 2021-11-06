# Model

class Track
  attr_reader :title, :artist, :url

  def initialize(title, artist, url, remixer, label, genre, release_date, price)
    @title = title
    @artist = artist
    @url = url
    @remixer = remixer
    @label = label
    @genre = genre
    @release_date = release_date
    @price = price
  end
end
