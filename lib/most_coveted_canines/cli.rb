class MostCovetedCanines::CLI

  def call
    welcome_user
    unleash_dogs
  end

  def welcome_user
    puts ""
    puts "*~*~*~*~*~* The 50 Most Popular Dog Breeds in the United States *~*~*~*~*~*"
    puts ""
  end

  def unleash_dogs # start main program loop
    range_starts_at = ""
    puts "Enter one of the following ranges to view dogs within that ranking tier:"
    puts "1-10, 11-20, 21-30, 31-40, 41-50"
    range_starts_at = gets.strip.to_i
    # calling the #to_i method on a string range will return the first number in that range as an integer
    # for example, "1-10".to_i will return 1 and "11-20".to_i will return 11
    if range_starts_at == 1 || range_starts_at == 11 || range_starts_at == 21 || range_starts_at == 31 || range_starts_at == 41
      puts "call a method that displays all dogs in the requested range by their rank number and breed"
      puts "call a method that asks user to pick a dog and then displays info about that particular dog"
      puts "call a method that asks user if they want to learn about another dog and if so, executes this method again"
    else
      puts "The input you entered is invalid. Please try again."
      unleash_dogs
    end
  end

end
