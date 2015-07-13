class Card

  attr_accessor :value,
                :suit,
                :facecard

  def initialize (suit, value, facecard)
    @value = value
    @suit = suit
    @facecard = facecard
  end
  #Turns card output into a string
  def to_s
    "#{facecard} of #{suit}"
  end

end
