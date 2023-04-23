require_relative "player"

class Card 
  SUITS = ["スペード", "ハート", "クローバー", "ダイヤ"].freeze  #freezeで定数にする(変更する）
  NUMBERS = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"].freeze

  def initialize(suit, number)
    @suit = suit
    @number = number
  end

  def to_s
    "#{@suit}の#{@number}" #文字列に変換するメソッド
  end

  def score  #カードの点数を計算するメソッド
    if @number == "A" 
      11
    elsif @number == "J" || @number == "Q" || @number == "K"
      10
    else
      @number.to_i
    end
  end
end
