class Question
  attr_reader :number1, :number2, :answer, :player
  
  # Method sets up the two random numbers for the math question and initializes the @answer as the
  # sum of @number1 and @number2.
  def initialize(player)
    @player = player  # The Question class now "knows" which player is answering
    @number1 = rand(1..20) # Random number between 1 and 20
    @number2 = rand(1..20) # Random number between 1 and 20
    @answer = @number1 + @number2
  end

  # Method prompts the player with the question and returns the question for them to answer.
  def ask_question
    puts "#{player.name}: What does #{number1} plus #{number2} equal?"
  end

  # Method checks if the player's input matches the correct answer (@answer).
  def correct_answer?(input)
    input.to_i == @answer # Converts the input to an integer and compares it to @answer
  end
end