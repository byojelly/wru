class Wru::Match

  attr_accessor :date, :time, :comp, :home, :score, :away, :venue, :more_info
  #lets keep track of a class array of all matches

  def self.upcoming
    puts <<-DOC.gsub /^\s*/, ''
              1. Match WRU vs X
              2. Match WRU vs X
              3. Match WRU vs X
              4. Match WRU vs X
              5. Match WRU vs X
              DOC
  end

  def get_page
    #set all html data from nokogirir into a variable
    doc = Nokogiri::HTML(open("http://www.wru.co.uk/eng/matchcentre/index.php"))
  end
  def get_matches
  # this code gives aan array of all matches on page
        self.get_page.css(".match-fixture")
  end
  #take the array and enumerate on each
  def make_matches
      self.get_matches.each do |event|
        match = Wru::Match.new
        match.date = event.css(".field_DateAbbrev").text
        match.time = event.css(".field_TimeLong").text
        match.comp = event.css(".field_CompStageAbbrev").text
        match.home = event.css(".field_HomeDisplay").text
        match.score = event.css(".field_Score").text.delete(", ")
        match.away = event.css(".field_AwayDisplay").text
        match.venue = event.css(".field_VenName").text
        #I am having a difficult time isolating the link url in match.more_info
        match.more_info = event.css(".field_Links").text

        match.venue
      end
  end



end

# =>      ./bin/console
#         Wru::Match.new.make_matches
