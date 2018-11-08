class Message

def self.welcome
  puts `clear`
  puts "Welcome to"
end

def self.number_of_players
  puts "Please enter the number of players (2-6):"
  puts ""
  print "Choice: "
end

def self.invalid_entry
  puts "Invalid entry, please try again"
  puts ""
end

def self.current_scores(players)
  puts `clear`
  puts "Current Scores"
  puts "--------------"
  players.each {|player|
    puts "#{player.id}: #{player.score}"
  }
  puts ""
end

def self.current_player_turn(player)
  puts ""
  puts "#{player.id}'s turn:"
  puts ""
end

def self.saved_dice(saved_dice_array, points)
  puts "Saved dice: #{saved_dice_array} | Total points: #{points}"
end

def self.roll_results(player, dice_array, points)
  puts "#{player.id}, you rolled: #{dice_array}. You have #{points} points."
  puts ""
end

def self.roll_options(total_points)
  puts ""
  puts "What would you like to do?"
  puts ""
  puts "1) End Turn and receive #{total_points} points"
  puts "2) Re-Roll All Dice"
  puts "3) Re-Roll Some Dice"
  puts ""
  print "Choice: "
end

def self.winner(player)
  puts "Player #{player.id} has won!"
end

def self.select_reroll_dice(dice_array)
  puts "Select one die you would like to set aside. Type 'done' to re-roll remaining dice"
  puts ""
  dice_array.each_with_index do |die, i|
    puts "#{i+1}: #{die}"
  end
  puts "#{dice_array.length+1}: Re-roll remaining dice"
  puts ""
  print "Choice: "
end

def self.greed

  puts <<~LOGO
 _____ _____ _____ _____ ____
|   __| __  |   __|   __|    \\
|  |  |    -|   __|   __|  |  |
|_____|__|__|_____|_____|____/
  LOGO
end

def self.end_turn(player, points)
  puts ""
  puts "The turn has ended. #{player.id} receives #{points} points."
  puts "Press Enter to continue"
end

end
