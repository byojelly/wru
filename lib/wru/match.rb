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

  def self.matches_with(team)
      chosen_team = []
      Wru::Match.matches.each do |game|
           if game.away.downcase.include?(team)
            chosen_team << game
          elsif game.home.downcase.include?(team)
            chosen_team << game
           end

       end
       chosen_team


      #      collect do |game, team|

      #     if game.away.downcase.include?("italy")
      #      chosen_team << game
      #     elsif game.home.downcase.include?("italy")
      #      chosen_team << game
      #     end
      #      chosen_team[0]
      #     end

    #returns an array of all the match objects with the team passed in as an argument
    ##when done, push to github, then send info to reviewer on slack slack id to cernanb
  end
end

# =>
#          cd code
#          cd labs
#          cd wru

  # =>    ./bin/schedule
#         Wru::Match.matches_with("italy")
