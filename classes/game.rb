class Game
  attr_reader :current_player
  
  # Method sets up the two players (player1 and player2) and initializes the current_player to start
  # the game (@player1).
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1 # Start with player1
  end

  # Method will toggle current_player between @player1 and @player2.
  def switch_turn
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  # Method will create a new question, prompt current_player with it, get the player’s answer,
  # check if it’s correct, and removes lives if necessary. 
  def take_turn
    question = Question.new(@current_player) # Pass current_player to the Question constructor
    question.ask_question
    print "> "
    answer = gets.chomp

    if question.correct_answer?(answer)
      puts "#{current_player.name}: YES! You are correct."
    else
      puts "#{current_player.name}: Seriously? NO!"
      @current_player.lose_life
    end
  end

  # Method displays each player's remaining lives.
  def display_scores
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
  end

  # Method checks if either player has zero lives, indicating the game should end.
  def game_over?
    !@player1.alive? || !@player2.alive?
  end

  # Method displays the winner (the player who still has lives left).
  def display_winner
    winner = @player1.alive? ? @player1 : @player2
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
  end

  # Method is the main game loop that keeps running turns until game_over? is true.
  # It will call take_turn, display_scores, and switch_turn each time, then end with display_winner.
  def play
    until game_over?
      take_turn
      display_scores
      puts "----- NEW TURN -----"
      switch_turn
    end
    display_winner
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end
end