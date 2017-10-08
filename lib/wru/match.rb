class Wru::Match

  attr_accessor :date, :time, :comp, :home, :score, :away, :venue, :more_info
  #lets keep track of a class array of all matches
  @@matches = [] #clas variable

  def initialize
      @@matches << self
  end

  def self.upcoming
    puts <<-DOC.gsub /^\s*/, ''
              1. Match WRU vs X
              2. Match WRU vs X
              3. Match WRU vs X
              4. Match WRU vs X
              5. Match WRU vs X
              DOC
  end

  def self.matches
    @@matches
  end


# the below code was added functionality requested after my code review.
#  my ownly question to narrow down functionality is in the following scenario.  when "Italy" is given as an argument the program works. As well if "Ital" is typed in the program works as well. It seems by using include? on my array it is fragmenting the passed on argument rather than treating the argument as a whole.
#what is nice is that this functionality work if you use "africa" then the results would bring back south africa matches. So it seems it works as a search bar.
  def self.matches_with(team)
      chosen_team = []
      team = team.downcase
      Wru::Match.matches.each do |game|
           if game.away.downcase.include?(team)
            chosen_team << game
          elsif game.home.downcase.include?(team)
            chosen_team << game
           end
       end
       if chosen_team.empty?
         puts "Sorry, but it looks like the search term for the team you are looking for is not finding any matches against any upcoming games. If you think this is an error please check your spelling of the team or use a different search term."
       else
         chosen_team
       end
    #returns an array of all the match objects with the team passed in as an argument
    ##when done, push to github, then send info to reviewer on slack slack id to cernanb
  end
end

  # =>    ./bin/schedule
#         Wru::Match.matches_with("italy")
