class RailTrails::Scraper
  attr_accessor :homepage
  
  def initialize(homepage_url)
    self.homepage = homepage_url
  end
  
  def scrape
    doc = Nokogiri::HTML(open(self.homepage))
      doc.css("div.trails div.row").each do |trail|
        name = trail.css("div.column.details")[0].css("span")[0].text
        url = trail.css("div.column.details a").attr("href").value
        length = trail.css("div.column.details")[0].css("span")[1].text
        state = trail.css("div.column.details")[0].css("span")[3].text
        surface = trail.css("div.column.details")[0].css("span")[4].text
        RailTrails::RailTrail.create(name, url, length, state, surface)
      end
  end
  
def scrape_details
  #railtrails.all.each do |trail|
  #open the individual trail url
  #scrape the info there
  #store that stuff in the object
  RailTrails::RailTrail.all each do |trail|
    doc = Nokogiri::HTML(open(trail.url))
    
  end
end

end