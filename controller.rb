# Controller
require_relative 'repository'
require_relative 'view'
require_relative 'services/scraper/scrape_all_tracks.rb'

class Controller
  def initialize
    # @repository = repository
    @view = View.new
  end

  def list
    keyword = @view.ask_user_for_keyword
    scraper = ScrapeAllTracks.new(keyword)
    tracks = scraper.call
    @view.print_tracks(tracks)
  end
end
