
require_relative "scores"
require_relative "game"

class Player
  attr_accessor :cards, :name, :scores
  def initialize(name,scores)
    @name = name
    @cards = []    #どうして@cardsがここに入るのか→deck.rbのdrawメソッドでpopメソッドが使われ、そこで得た@cardsを入れるため
    @scores = scores

  end

  def draw(deck,number)
    @cards << deck.draw(number)#Deckクラスのdrawメソッド。指定した枚数デッキから引いて@cardsに格納
    @cards.flatten! #二次元配列を一次元配列にする

  end

  def scores
    @scores.calculate(@cards) #scoresクラスのcalculateメソッドを呼び出す
  end
    
end
