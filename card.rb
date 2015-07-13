class Card

  attr_accessor :value,
                :suit,
                :facecard

  def initialize (suit, value, facecard)
    @value = value
    @suit = suit
    @facecard = facecard
  end

  def to_s
    "#{facecard}-#{suit}"
  end

end
