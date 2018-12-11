class Wru::Match

  attr_accessor :date, :time, :comp, :home, :score, :away, :venue, :more_info
  #above creates attribute settings for each initialized class
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
end

# =>      ./bin/console
#         Wru::Schedule.new.make_matches
