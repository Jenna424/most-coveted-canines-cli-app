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
      case range_starts_at
      when 1
        reveal_range(1)
        demand_dog
        pick_new_puppy
        puts "call a method that asks user if they want to learn about another dog and if so, executes this method again"
      when 11
        reveal_range(11)
        demand_dog
        pick_new_puppy
        puts "call a method that asks user if they want to learn about another dog and if so, executes this method again"
      when 21
        reveal_range(21)
        demand_dog
        pick_new_puppy
        puts "call a method that asks user if they want to learn about another dog and if so, executes this method again"
      when 31
        reveal_range(31)
        demand_dog
        pick_new_puppy
        puts "call a method that asks user if they want to learn about another dog and if so, executes this method again"
      when (41)
        reveal_range(41)
        demand_dog
        pick_new_puppy
        puts "call a method that asks user if they want to learn about another dog and if so, executes this method again"
      end
    else
      puts "The input you entered is invalid. Please try again."
      unleash_dogs
    end
  end

  def reveal_range(first_in_range)
    puts "Dogs Ranked from Numbers #{first_in_range} through #{first_in_range + 9}:"
    # ultimately, this method should first get array of dog instances at specific array indices
    # then iterate through that array of dog instances and for each dog instance, print rank number followed by breed attribute
    # There are 10 numbers in each range, so the first number in the range + 9 is the last number in the range
    case first_in_range
    when 1
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
    when 11
      puts "11. Pointers (German Shorthaired)"
      puts "12. Siberian Huskies"
      puts "13. Dachshunds"
      puts "14. Great Danes"
      puts "15. Doberman Pinschers"
      puts "16. Australian Shepherds"
      puts "17. Miniature Schnauzers"
      puts "18. Pembroke Welsh Corgis"
      puts "19. Cavalier King Charles Spaniels"
      puts "20. Shih Tzu"
    when 21
      puts "21. Boston Terriers"
      puts "22. Pomeranians"
      puts "23. Havanese"
      puts "24. Shetland Sheepdogs"
      puts "25. Brittanys"
      puts "26. Spaniels (English Springer)"
      puts "27. Bernese Mountain Dogs"
      puts "28. Mastiffs"
      puts "29. Spaniels (Cocker)"
      puts "30. Chihuahuas"
    when 31
      puts "31. Vizslas"
      puts "32. Pugs"
      puts "33. Maltese"
      puts "34. Weimaraners"
      puts "35. Newfoundlands"
      puts "36. Miniature American Shepherds"
      puts "37. Collies"
      puts "38. Border Collies"
      puts "39. Basset Hounds"
      puts "40. Cane Corso"
    when 41
      puts "41. West Highland White Terriers"
      puts "42. Rhodesian Ridgebacks"
      puts "43. Retrievers (Chesapeake Bay)"
      puts "44. Shiba Inu"
      puts "45. Bichons Frises"
      puts "46. Akitas"
      puts "47. Belgian Malinois"
      puts "48. Bullmastiffs"
      puts "49. St. Bernards"
      puts "50. Soft Coated Wheaten Terriers"
    end
  end

  def demand_dog
    input = nil
    puts "Enter the rank of the dog breed you'd like to explore further:"
    input = gets.strip
    if input.to_i.between?(1, 50)
      showcase_dog
    else
      puts "The input you entered is invalid. Please try again."
      demand_dog
    end
  end

  def showcase_dog
    puts "*~*~*~*~*~* placeholder for breed attribute of dog instance *~*~*~*~*~*"
    puts "Group: scraped attribute"
    puts "Personality: scraped attribute"
    puts "Year Recognized by AKC: scraped attribute"
    puts "Rank: scraped attribute"
    puts "Nutrition: scraped attribute"
    puts "Grooming: scraped attribute"
    puts "Exercise: scraped attribute"
    puts "Fun Fact: scraped attribute"
    puts "Appearance: scraped attribute"
    puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*"
  end

  def pick_new_puppy
    input = ""
    puts "Would you like to learn about another dog breed?"
    puts "Type yes to emBARK on your new dog discovery or type no to quit the program."
    input = gets.strip.downcase

    if input == "yes"
      unleash_dogs
    elsif input == "no"
      puts "Hope you enjoyed learning about the 50 most popular dog breeds! Goodbye for now!"
    else
      puts "The input you entered is invalid. Please try again."
      pick_new_puppy
    end
  end
end
