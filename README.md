# Greed

## Learning Goals

- Apply concepts learned about `Hash`es and `Array`es
- Create an object oriented program
- Design interactive command line prompts
- Construct game logic using conditionals

## Introduction

```sh
Welcome to
   _____ _____ _____ _____ ____
  |   __| __  |   __|   __|    \
  |  |  |    -|   __|   __|  |  |
  |_____|__|__|_____|_____|____/
```

In some of our previous lessons, we worked on building the basics of a dice
throwing game. Now, it is time to put that code to use and implement a
fully-functioning command line game, [Greed]. Greed is a game where players
compete to reach 10000 points. Each turn, players roll a set of six dice for
the chance to collect points. However with this chance comes risk: at the end
of their turn they must make a fateful decision: play it safe or risk
everything (and potentially win big)!

In this lab, you are tasked with building the game logic for Greed using object
oriented Ruby. You will need to apply many concepts discussed in previous
lessons, including `Array` and `Hash` creation, conditionals and loops.

## Instructions

Greed involves players taking turns and making choices, and to convert the game
to a command line interface means lots of reoccurring messages to display. The
focus of this lab is to build the game logic, so all necessary messages for the
command line are already provided for you in `lib/message.rb`.

Read the [**Rules of Greed**](#rules) in the next section to familiarize
yourself. There are many ways to write a working solution, but for testing
purposes, functionality should be separated into the following methods:

* `Greed` class
  * Must have `#calculate_points(dice)`: Takes a collection of `Integer`s and
    returns the correct total point value, based on the rules of Greed
    explained below.
  * When `new()` is called, a new game should begin. While you're iterating
    towards your solution, run `ruby bin/start.rb` to start a new game.
* `Player` class
  * <How? Where?> should be used to keep track of individual player scores.

Run `learn` as you work through your logic to see your progress. When you've
passed all tests, you should have a fully working game, able to handle the
various decisions involved in the game.

**Note:** Since you'll be dealing with loops and conditionals, tests will
automatically time out after 5 seconds if stuck in an infinite loop while
testing your solution.

<a name=rules"></a>

## Rules of Greed

Greed requires at least 2 players and 6 six sided dice. Players take turns
rolling dice following a set of rules.

On a player's turn, the player starts by rolling all six dice.

- If the player does not roll a 1 or 5 or one of the special conditions, the
  player's turn ends.

  - Every 1 a player rolls is worth 100 points
  - Every 5 a player rolls is worth 50 points
  - Three of a kind for any number is worth that number times 100 in points
  - Four of a kind is worth the number times 100 x 2
  - Five of a kind is worth the number times 100 x 4
  - Six of a kind is worth the number times 100 x 8
  - Three of a kind for the number 1 is worth 1000 points
    - Four of a kind for 1 is worth 2000 points
    - Five of a kind for 1 is worth 4000 points
    - Six of a kind for 1 is worth 8000 points
  - Three pairs of numbers is worth 500 points
  - A five dice straight (1,2,3,4,5 or 2,3,4,5,6) is worth 1000 points
  - A six dice straight is worth 1500 points

If the player's dice roll meets any of the above criteria, they can choose to do
one of three things:

- The player can keep the score they got and add it to their total, ending
  their turn.

  > Player 1 rolls [1,3,5,3,3,1]: 200 points for two 1s, 50 points for 5, and 300 points for three 3s
  > Player 1 chooses to keep this score and end their turn, receiving 550 points

- The player can re-roll all six dice to try and get a better score, forfeiting
  any points they may have earned on the first roll

  > Player 2 rolls [3,2,6,2,2,6]: 200 points for three 2s
  > Player 2 chooses to roll all six dice again, forfeiting the 200 points
  > Player 2 rolls [5,2,2,2,1,5]: 100 points for one 1, 100 points for two 5s, 200 points for three 2s
  > Player 2 chooses to keep this score and end their turn, receiving 400 points

- The player can re-roll any amount of dice, setting aside particular dice.

  - Dice that are set aside cannot be used in combination with any newly
    rolled dice
  - If the player's re-roll does not result in any points, the turn ends and
    the player receives 0 points

  > Player 3 rolls [5,5,3,5,5,6]: 1000 points for four 5s
  > Player 3 chooses to keep the four 5s, but re-roll the remaining to dice
  > Player 3 rolls [3,1]: 100 points for one 1
  > Player 3 choose to keep the one 1 and re-roll the last die
  > Player 3 rolls [6]: 0 points
  > Player 3 does not receive any points from any of the three rolls and the turn ends

## Conclusion

If you've passed all the tests, congratulations! You've just developed a fully
functional game!

## Resources

- [Arrays]
- [Hashes]

[hashes]: https://ruby-doc.org/core-2.5.1/Hash.html
[arrays]: https://ruby-doc.org/core-2.5.1/Array.html
[greed]: http://thehobbyts.com/greed-dice-game-rules/
