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
      reveal_range(range_starts_at)
      puts "call a method that asks user to pick a dog and then displays info about that particular dog"
      puts "call a method that asks user if they want to learn about another dog and if so, executes this method again"
    else
      puts "The input you entered is invalid. Please try again."
      unleash_dogs
    end
  end

  def reveal_range(first_in_range)
    # ultimately, this method should first get array of dog instances at specific array indices
    # then iterate through that array of dog instances and for each dog instance, print rank number followed by breed attribute
    # There are 10 numbers in each range, so the first number in the range + 9 is the last number in the range
    puts "Dogs Ranked from Numbers #{first_in_range} through #{first_in_range + 9}:"
    puts "1. Retrievers (Labrador)"
    puts "2. German Shepherd Dogs"
    puts "3. Retrievers (Golden)"
    puts "4. Bulldogs"
    puts "5. Beagles"
    puts "6. French Bulldogs"
    puts "7. Poodles"
    puts "8. Rottweilers"
    puts "9. Yorkshire Terriers"
    puts "10. Boxers"
  end
end
