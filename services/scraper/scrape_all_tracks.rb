require 'nokogiri'
require 'open-uri'

class ScrapeAllTracks
  def initialize(keyword)
    @keyword = keyword.gsub("\s","+")
  end

  def call
    url = "https://www.beatport.com/search?q=#{@keyword}"
    doc = Nokogiri::HTML(URI.open(url).read, nil, 'utf-8')

    # puts doc
    tracks = {}
    doc.search(".ec-bucket").each_with_index do |match, index|
      # Get track url
      url = doc.search(".buk-track-title a")[index + 1].attribute("href").value.prepend('https://www.beatport.com')
      # Get track title
      title = doc.search(".buk-track-title")[index + 1].text.split
      title = format_title(title)
      # Get artist
      artist = doc.search(".buk-track-artists")[index + 1].text.strip
      # Get remixers
      remixer = doc.search(".buk-track-remixers")[index + 1].text.strip
      # Get track label
      label = doc.search(".buk-track-labels")[index + 1].text.strip
      # Get track genre
      genre = doc.search(".buk-track-genre")[index + 1].text.strip
      # Get track release date
      release_date = doc.search(".buk-track-released")[index + 1].text.strip
      # Get track price
      price = doc.search(".track .buy-button")[index + 1].text.strip.slice(1..)

      tracks[title] = {
        artist: artist,
        url: url,
        remixer: remixer,
        label: label,
        genre: genre,
        release_date: release_date,
        price: price
      }
    end
    tracks
  end

  private

  def format_title(title_array)
      title_array[-2].prepend('(')
      title_array[-1] << ')'
      title_array.join(' ')
  end
end
