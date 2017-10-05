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
    #
    #returns an array of all the match objects with the team passed in as an argument
    "hello"
    #when done, push to github, then send info to reviewer on slack slack id to cernanb
  end
end

# =>      ./bin/console
#         Wru::Schedule.new.make_matches
