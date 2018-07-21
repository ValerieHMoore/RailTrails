class RailTrails::Cli
attr_accessor :name

  def initialize(name)
    @name = name
  end

  def welcome
    puts "Welcome to #{self.name}!"
    puts "This app will help you find a rail trail near you."
    main_menu
  end

  def main_menu
    RailTrails::RailTrail.all.clear
    puts "Please enter a five-digit zip code"
    puts "Type exit to exit the program"
    input = gets.strip
    if input =~ /\A[0-9]{5}\z/
      list_railtrails(input)
      elsif input.downcase == "exit"
        puts "Happy Trails! Please consider making a donation to www.railstotrails.org"
        else
          try_again
          main_menu
        end
  end
  
  def list_railtrails(input)
    puts "Here is a list of railtrails near you:"
    RailTrails::Scraper.new("https://www.traillink.com/trailsearch/?mmloc=" + input).scrape
    puts "Enter the trail number to get more details"
    trail_number = gets.strip.to_i
      if trail_number <= RailTrails::RailTrail.all.length
        RailTrails::RailTrail.select.with_index do |trail, index|
        trail_match?(index)
        scrape_details(url)
      else
      try_again
      main_menu
      end
  end

  def trail_match?
    if trail_number == trail.index-1
      trail.url
  end
  
  def try_again
    puts "Hmmm...try again."
  end
     
end