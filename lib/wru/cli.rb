

#this is our cli controller - responsible for user interactions in the bin folder daily--deal
require 'pry'
class Wru::CLI
    def call
        Wru::Scraper.new.make_matches   #scraper
      #binding.pry was added in below after code review so that functionality of a class method matches_with(team) can be inserted
        binding.pry
        @matches = Wru::Match.matches
        greeting
        schedule
    end

    def matches_with_team
      team = gets.strip
      matches = Wru::Match.matches_with(team)
      if matches.empty?
        puts "Sorry, but it looks like the search term for the team you are looking for is not finding any matches against any upcoming games. If you think this is an error please check your spelling of the team or use a different search term."
      else
        #display all the info for the matches
      end
    end

    def greeting
      puts <<-DOC.gsub /^\s*/, ''
                Hello and welcome to the Wales Rugby Union match schedule program.
                Here is a list of upcoming matches.
              DOC
      puts #space line
      list_matches
    end
    def list_matches
      match_breakdown

    end
    def match_breakdown
      @matches.each.with_index(1) do |match, i|  #.with_index(1) is a trick to chain with_index(1) allows you to circumvent having to subtract one from the index of an array to yield its position ((arrays start at 0 this allows it to start at 1))
          puts "##{i}. #{match.date} - #{match.home} v #{match.away}"
      #@deals.each.with_index(1) do |deal, i|
      #    puts "#{i}. #{deal.name} - #{deal.price} - #{deal.availability}"
      end
      puts #space line
      puts  "Enter the number of the match would you like to learn more information about."
      puts #space
      #in this section lets call a class that extracts match info
    end


    def schedule

        input =nil
        while input != "exit"
              input = gets.strip.downcase #downcase allows any input to be processed in a similar manner
              puts #space
              if input.to_i > 0 && input.to_i <= @matches.count#strings convert to 0 value with .to_i

                        the_match = @matches[input.to_i - 1] #this provides the array index of this match and then puts the object
                        puts <<-DOC.gsub /^\s*/, ''
                              Date = #{the_match.date}
                              Time = #{the_match.time} (local time of the home country)
                              Type of Match = #{the_match.comp}
                              #{the_match.home} (home) against #{the_match.away} (away)
                              Score = #{the_match.score}
                              Venue = #{the_match.venue}
                              Additional Information = #{the_match.more_info}
                              DOC
                        puts
                        puts <<-DOC.gsub /^\s*/, ''
                                There are #{@matches.count} matches in the schedule. Type the corresponding match number to learn more, type list to see the schedule again, or type exit if you would like to stop the program.
                             DOC
              elsif input == "list"
                  match_breakdown
              elsif input.to_i <0
                puts "Not sure what you were looking for with your last inquiry. Type the corresponding match number to learn more, type list to see the schedule again, or type exit if you would like to stop the program."
                puts
              elsif input.to_i > @matches.count
                puts "Not sure what you were looking for with your last inquiry. Type the corresponding match number to learn more, type list to see the schedule again, or type exit if you would like to stop the program."
                puts

              elsif input == "exit"
                puts "Thanks for visiting. Go CYMRU!!"
              else
                puts "Not sure what you were looking for with your last inquiry. Type the corresponding match number to learn more, type list to see the schedule again, or type exit if you would like to stop the program."
                puts

              end
        end
    end
end



#     ./bin/schedule
