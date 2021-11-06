class View
  def ask_user_for_keyword
    puts "Please enter a keyword to search for"
    return gets.chomp
  end

  def print_tracks(tracks)
    tracks.each_with_index do |(key, value), index|
      title = "#{index + 1}. #{value[:artist]} - #{key}"
      puts title
      puts "Genre: #{value[:genre]}"
      puts "Label: #{value[:label]}"
      puts "Price: €#{value[:price]}"
      puts "-".rjust(title.length, "-")
    end
  end
end
