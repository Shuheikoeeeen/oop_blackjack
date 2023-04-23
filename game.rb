require_relative "deck"
require_relative "player"
require_relative "scores"
require_relative "dealer"

class Game 

  def initialize
    @player = Player.new("あなた",Scores.new)
    @deck = Deck.new
    @dealer = Dealer.new("ディーラー",Scores.new)  #引数が二つ。またscoresクラスのインスタンスを渡している。Playerクラスのinitializeメソッドの引数にscoresクラスのインスタンスを渡してあげる

    
  end

  def start
    puts "ブラックジャックを開始します。"

    @player.draw(@deck,2)
    puts "#{@player.name}の引いたカードは#{@player.cards[0].to_s}です。"
    puts "#{@player.name}の引いたカードは#{@player.cards[1].to_s}です。"
  
    @dealer.draw(@deck,2)
    puts "#{@dealer.name}の引いたカードは#{@dealer.cards[0].to_s}です。"
    puts "ディーラーの引いた2枚目のカードはわかりません。"

    score_index = 1
    puts "あなたの現在の得点は#{@player.scores}です。"
    while @player.scores <= 21 do
      puts "カードを引きますか？（Y/N）"
      answer = gets.chomp
      if answer == "Y"
        @player.draw(@deck,1)
        score_index += 1
        puts "#{@player.name}の引いたカードは#{@player.cards[score_index].to_s}です。"
        puts "#{@player.name}の現在の得点は#{@player.scores}です。"
      if @player.scores > 21
          puts "#{@dealer.name}の引いた2枚目のカードは#{@dealer.cards[1].to_s}でした。"
          puts "#{@dealer.name}の現在の得点は#{@dealer.scores}です。" 
          puts "#{@player.name}の負けです"
       break
      end
      elsif answer == "N"
        puts "#{@dealer.name}の引いた2枚目のカードは#{@dealer.cards[1].to_s}でした。"
        puts "#{@dealer.name}の現在の得点は#{@dealer.scores}です。" 
        while @dealer.scores < 17 do
          @dealer.draw(@deck,1)
          score_index = 1
          score_index += 1
          puts "#{@dealer.name}の引いたカードは#{@dealer.cards[score_index].to_s}です。"
          puts "#{@dealer.name}の現在の得点は#{@dealer.scores}です。"  
        end

        if @dealer.scores > 21
          puts "#{@player.name}の勝ちです"
          break
        elsif @dealer.scores > @player.scores
          puts "#{@player.name}の負けです"
          break
        elsif @dealer.scores < @player.scores
          puts "#{@player.name}の勝ちです"
          break
        elsif @dealer.scores == @player.scores
          puts "引き分けです"
          break
        end
      end
    end
    puts "ブラックジャックを終了します。"
  end
end
