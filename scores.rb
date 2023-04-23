class Scores
  
  def calculate(cards) 
    total_scores = 0
    a_count = 0
    scores = cards.map{|card| card.score}.sort #mapメソッドでcard.scoreを呼び出し、scoresに格納。sortで昇順に並び替える
    scores.each do |score|
      if score == 11
        a_count += 1
      end
      total_scores += score
    end
    a_count.times do
      if total_scores > 21
        total_scores -= 10
      end
    end
    total_scores
  end


end