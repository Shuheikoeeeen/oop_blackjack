require_relative "card"

class Deck
  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::NUMBERS.each do |number|    #定数はクラス外からでも参照できる
        @cards << Card.new(suit, number)
      end
    end
    @cards.shuffle!
  end

  def draw(number)
    @cards.pop(number)   #popでリターンされた@cardsがplayerクラスの@cardに入る
  end


end