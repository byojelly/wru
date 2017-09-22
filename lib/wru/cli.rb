#this is our cli controller - responsible for user interactions in the bin folder daily--deal

class Wru::CLI
    def call
        greeting
        schedule
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
      @matches = Wru::Schedule.new.make_matches
      @matches.each.with_index(1) do |match, i|  #.with_index(1) is a trick to chain with_index(1) allows you to circumvent having to subtract one from the index of an array to yield its position ((arrays start at 0 this allows it to start at 1))
          puts "##{i}. #{match.date} - #{match.home} v #{match.away}"
      #@deals.each.with_index(1) do |deal, i|
      #    puts "#{i}. #{deal.name} - #{deal.price} - #{deal.availability}"
      end
      puts #space line
      puts  "Enter the number of the match would you like to learn more information about."

      #in this section lets call a class that extracts match info

    end

    def schedule
        input =nil
        while input != "exit"
              input = gets.strip.downcase #downcase allows any input to be processed in a similar manner
              if input.to_i > 0 #strings convert to 0 value with .to_i

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
                                There are #{@matches.count} matches in the schedule. Type the corresponding number from the list of upcoming matches to learn more.  If you would like to exit, type "exit" into the terminal.
                             DOC
              else
                puts "Not sure what you want with your last input. Type the corresponding match number to learn more or type exit if you would like to stop the program."
                puts
                list_matches
              end
        end
    end
end



#     ./bin/schedule
