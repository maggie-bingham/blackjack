require_relative 'card'
require_relative 'deck'
require_relative 'hand'

class Game

  attr_accessor :player,
                :dealer,
                :deck

  def initialize(deck=Deck.new)
    @deck = deck
    @player = Hand.dealt.new
    @dealer = Hand.dealt.new
    2.times {player.hit!(deck)}
    2.times {dealer.hit!(deck)}
  end
  #Determines how game should be played
  def play
    blackjack
    bust
    puts "Player: [#{player.dealt.join("][")}] = #{player.score}."
    puts "Dealer: [#{dealer.dealt.first}]"
    loop do
      puts "Do you want to HIT(h) or STAND(s)?"
      desire = $stdin.gets.chomp.downcase
      if desire == "h"
        hit
        blackjack
        bust
      else desire == "s"
        dealer.auto_dealer(deck)
        stand
      end
    end
  end
  #Determines if player wants another card
  def hit
    player.hit!(deck)
    puts "[#{player.dealt.last}] Total: #{player.score}."
    puts "Dealer: [#{dealer.dealt[1]}]"
  end
  #Determines if player wants to stay with the cards already have
  def stand
    dealer.auto_dealer(deck)
    determine_winner
    puts "Dealer had [#{dealer.dealt.join("][")}]"
    play_again
  end

  #Determines Blackjack winner
  def blackjack
    if player.score == 21 || dealer.score == 21
      puts "------------BLACKJACK!------------"
      show_hand
      play_again
    end
  end
  #Determines if somene went over 21 and busted
  def bust
    if player.score > 21 || dealer.score > 21
      puts "---------------BUST!---------------"
      show_hand
      play_again
    end
  end

  #Determines ways to win
  def determine_winner
    blackjack
    bust
    if player.score == dealer.score
      puts "---------Tie - Player Wins!---------"
    elsif player.score > dealer.score
      puts "------------Player Wins!------------"
      puts "Dealer had #{dealer.score}."
    else dealer.score > player.score
      puts "-------------Dealer Wins------------"
      puts "Dealer Score: #{dealer.score}"
    end
  end
  #Determines if player wants to play again.
  def play_again
    puts "Do you want to play again(y/n)?"
    desire = $stdin.gets.chomp.downcase
      if desire == "y"
        Game.new.play
      else
        puts "Thanks for playing!"
        exit
      end
  end
  #Shows scores of the Player and Dealer
  def show_hand
    puts "Player Score: #{player.score}: [#{player.dealt.join("][")}]"
    puts "Dealer Score: #{dealer.score}: [#{dealer.dealt.join("][")}]"
  end

end

Game.new.play
