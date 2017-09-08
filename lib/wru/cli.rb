#this is our cli controller - responsible for user interactions in the bin folder daily--deal

class Wru::CLI
    def call
        list_matches
        schedule
    end
    def list_matches
      puts <<-DOC.gsub /^\s*/, ''
                Hello and welcome to the Wales Rugby Union match schedule program.
                Here is a list of upcoming matches.
                1. Match WRU vs X
                2. Match WRU vs X
                3. Match WRU vs X
                4. Match WRU vs X
                5. Match WRU vs X
                Enter the number of the match would you like to learn more information about.
              DOC
      #in this section lets call a class that extracts match info

    end
    def schedule
        input =nil
        while input != "exit"
              input = gets.strip.downcase #downcase allows any input to be processed in a similar manner
              case input
                when "1"
                  puts "More info for event 1"
                when "2"
                  puts "More info for event 2"
                when "list"
                  list_matches
                else
                  puts "Please review the matches and make a selection from the list. Type exit to leave the system."
              end
        end
    end
end



#     ./bin/matches
