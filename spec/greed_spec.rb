require 'spec_helper'
require 'pry'
require 'pry-rescue'
require_relative '../lib/message.rb'
require_relative '../lib/greed.rb'
require_relative '../lib/player.rb'

describe 'Greed' do
  def expect_welcome
    expect(new_stdout).to receive(:puts).with("\e[3J\e[H\e[2J").ordered
    expect(new_stdout).to receive(:puts).with("Welcome to").ordered
  end

  def expect_number_of_players
    expect(new_stdout).to receive(:puts).with("Please enter the number of players (2-6):").ordered
    # expect(new_stdout).to receive(:puts).with("").ordered
    print "Choice: "
  end

  def expect_invalid_entry
    expect(new_stdout).to receive(:puts).with("Invalid entry, please try again").ordered
    # expect(new_stdout).to receive(:puts).with("").ordered
  end


  def expect_current_scores(test_number)
    test_score_array = [[{id: 1, score: 0}, {id: 2, score: 0}],[{id: 1, score: 8000}, {id: 2, score: 0}]]
    expect(new_stdout).to receive(:puts).with("\e[3J\e[H\e[2J").ordered
    expect(new_stdout).to receive(:puts).with("Current Scores").ordered
    expect(new_stdout).to receive(:puts).with("--------------").ordered

    expect(new_stdout).to receive(:puts).with("Player #{test_score_array[test_number][0][:id]}: #{test_score_array[test_number][0][:score]}").ordered
    expect(new_stdout).to receive(:puts).with("Player #{test_score_array[test_number][1][:id]}: #{test_score_array[test_number][1][:score]}").ordered

  end

  def expect_new_turn(player)
    test_players_array = [{id: 1}, {id: 2}, {id: 3}, {id: 4}, {id: 5}, {id: 6}]
    # expect(new_stdout).to receive(:puts).with("").ordered
    expect(new_stdout).to receive(:puts).with("Player #{test_players_array[player][:id]}'s turn:").ordered
    # expect(new_stdout).to receive(:puts).with("").ordered
  end

  def expect_saved_dice(saved_dice_array, points)
    expect(new_stdout).to receive(:puts).with("Saved dice: #{saved_dice_array} | Total points: #{points}").ordered
  end

  def expect_roll_results(player, dice_array, points)
    expect(new_stdout).to receive(:puts).with("Player #{player}, you rolled: #{dice_array}. You have #{points} points.").ordered
    # expect(new_stdout).to receive(:puts).with("").ordered
  end

  def expect_roll_options(points, existing_points)
    # expect(new_stdout).to receive(:puts).with("").ordered
    expect(new_stdout).to receive(:puts).with("What would you like to do?").ordered
    # expect(new_stdout).to receive(:puts).with("").ordered
    expect(new_stdout).to receive(:puts).with("1) End Turn and receive #{points + existing_points} points").ordered
    expect(new_stdout).to receive(:puts).with("2) Re-Roll All Dice").ordered
    expect(new_stdout).to receive(:puts).with("3) Re-Roll Some Dice").ordered
    # expect(new_stdout).to receive(:puts).with("").ordered
    print "Choice: "
  end

  def expect_roll_again
    expect(new_stdout).to receive(:puts).with("Re-rolling...").ordered
    # expect(new_stdout).to receive(:puts).with("").ordered
  end

  def expect_select_reroll_dice(dice_array)
    expect(new_stdout).to receive(:puts).with("Select one die you would like to set aside. Type 'done' to re-roll remaining dice").ordered
    # expect(new_stdout).to receive(:puts).with("").ordered
    dice_array.each_with_index do |die, i|
      expect(new_stdout).to receive(:puts).with("#{i+1}: #{die}").ordered
    end
    expect(new_stdout).to receive(:puts).with("#{dice_array.length+1}: Re-roll remaining dice").ordered
    # expect(new_stdout).to receive(:puts).with("").ordered
    print "Choice: "
  end

  def expect_greed

  expect(new_stdout).to receive(:puts).with("   _____ _____ _____ _____ ____  ").ordered
  expect(new_stdout).to receive(:puts).with("  |   __| __  |   __|   __|    \\").ordered
  expect(new_stdout).to receive(:puts).with("  |  |  |    -|   __|   __|  |  |").ordered
  expect(new_stdout).to receive(:puts).with("  |_____|__|__|_____|_____|____/ ").ordered
  # expect(new_stdout).to receive(:puts).with("").ordered

  end

  def expect_end_turn(player, points)
    # expect(new_stdout).to receive(:puts).with("").ordered
    expect(new_stdout).to receive(:puts).with("The turn has ended. Player #{player} receives #{points} points.").ordered
    expect(new_stdout).to receive(:puts).with("Press Enter to continue").ordered
  end

  it 'starts a new game with Greed.start_game' do
    # Object.any_instance.stub(puts: "")
    # binding.pry
    new_stdout = $stdout
    original_stdout = $stdout.clone
    greed = Greed.new()
    allow(greed).to receive(:get_number_of_players) { 2 }
    allow(greed).to receive(:get_turn_decision) { 1 }
    allow(greed).to receive(:press_enter_for_next_turn) { "" }
    allow(greed).to receive(:press_enter_for_next_turn) { "" }
    allow(greed).to receive(:roll_dice) { [1,1,1,1,1,1] }

    expect_welcome
    expect_greed
    expect_number_of_players
    expect_current_scores(0)
    expect_new_turn(0)
    expect_saved_dice([], 0)
    expect_roll_results(1, [1, 1, 1, 1, 1, 1], 8000)
    expect_roll_options(8000, 0)
    # expect_end_turn(1, 8000)
    # expect_current_scores(1)
    # expect_new_turn(player)

    greed.start_game

    $stdout.rewind

end
    #

    #
    #
    #
    #


    #

    # expect(new_stdout).to receive(:puts).with("Player 1's turn:")
    # expect(new_stdout).to receive(:puts).with("Saved dice: [] | Total points: 0")
    # expect(new_stdout).to receive(:puts).with("Player 1, you rolled: [1, 1, 1, 1, 1, 1]. You have 8000 points.")
    # expect(new_stdout).to receive(:puts).with("What would you like to do?")
    # expect(new_stdout).to receive(:puts).with("1) End Turn and receive 8000 points")
    # expect(new_stdout).to receive(:puts).with("2) Re-Roll All Dice")
    # expect(new_stdout).to receive(:puts).with("3) Re-Roll Some Dice")
    # expect(new_stdout).to receive(:puts).with("The turn has ended. Player 1 receives 8000 points.")
    # Object.any_instance.stub(gets: "1")



  describe 'calculate_points' do

  end
end
