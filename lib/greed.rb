require 'pry'
require_relative './message.rb'

class Greed

  def initialize
    @players = []
  end

  def opening_prompt
    loop do
      Message.welcome
      Message.greed
      Message.number_of_players
      player_count = get_number_of_players
      return player_count if (1..6).include? player_count
      Message.invalid_entry
    end
  end

  def start_game
    @player_count = opening_prompt

    @player_count.times do |i|
      @players << Player.new(i+1)
    end

    loop do
      @players.each_with_index {|player|
        turn_over = false
        while turn_over == false do
          Message.current_scores(@players)
          Message.new_turn(player)
          turn_over = take_turn(player)
          exit if winner?
        end
      }
    end

    binding.pry

  end

  def take_turn(player)
    saved_dice_array = []
    roll(player, saved_dice_array)
  end

  def roll(player, saved_dice_array)
    dice_array = roll_dice(6 - saved_dice_array.flatten.length)
    points = calculate_points(dice_array)
    if points == 0

      Message.current_scores(@players)
      Message.greed
      Message.roll_results(player, dice_array, points)
      Message.end_turn(player, points)
      press_enter_for_next_turn
      return true
    else
      loop do
        existing_points = 0
        saved_dice_array.each { |array|
          existing_points += calculate_points(array)
        }
        Message.current_scores(@players)
        Message.new_turn(player)
        Message.saved_dice(saved_dice_array, existing_points)
        Message.roll_results(player, dice_array, points)
        Message.roll_options(points, existing_points)

        choice = get_turn_decision

        case choice
        when 1
          player.score += points+existing_points
          Message.end_turn(player, points+existing_points)
          press_enter_for_next_turn
          return true
        when 2
          Message.roll_again
          saved_dice_array = []
          return roll(player, saved_dice_array)
        when 3
          ready = false
          new_dice_array = []
          while ready == false
            Message.current_scores(@players)
            Message.saved_dice(new_dice_array, calculate_points(new_dice_array))
            Message.select_reroll_dice(dice_array)
            choice = get_die_decision
            if (1..dice_array.length).include? choice
              new_dice_array.push(dice_array.slice!(choice-1, 1).first)
            else
              ready = true
            end
          end
          saved_dice_array.push(new_dice_array) if new_dice_array.length > 0
          Message.roll_again
          return roll(player, saved_dice_array)
        else
          Message.invalid_entry
        end
      end
    end
  end

  def calculate_points(dice_array)
    points = 0
    dice_hash = dice_array.each_with_object(Hash.new(0)) { |die, acc| acc[die] += 1 }
    dice_hash.keys.each {|key|
      case dice_hash[key]
      when 1..2
        if key == 1
          points += 100 * dice_hash[key]
        elsif key == 5
          points += 50 * dice_hash[key]
        end
      when 3
        if key == 1
          points += 1000
        else
          points += key*100
        end
      when 4
        if key == 1
          points += 2000
        else
          points += key*200
        end
      when 5
        if key == 1
          points += 4000
        else
          points += key*400
        end
      when 6
        if key == 1
          points += 8000
        else
          points += key*800
        end
      end
    }
    if dice_hash.keys.length == 3 && dice_hash.keys.none? {|key| dice_hash[key] != 2}
      points = 500
    elsif dice_hash.keys == [1,2,3,4,5] || dice_hash.keys == [2,3,4,5,6]
      points = 1000
    elsif dice_hash.keys.length == 6
      points = 1500
    end

    points
  end

  def winner?
    @players.find {|player| player.score > 10000}
  end


  def roll_dice(number)
    Array.new(number).map {
      roll_die
    }
  end

  def roll_die
    rand(6)+1
  end

  def get_number_of_players
    gets.chomp.strip.to_i
  end

  def get_turn_decision
    gets.chomp.strip.to_i
  end

  def get_die_decision
    gets.chomp.strip.to_i
  end

  def press_enter_for_next_turn
    gets
  end
end
