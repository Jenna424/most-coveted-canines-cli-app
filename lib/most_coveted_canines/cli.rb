class MostCovetedCanines::CLI

  def call
    make_puppies
    add_puppy_properties
    welcome_user
    unleash_dogs
  end

  def make_puppies
    array_of_hashes = MostCovetedCanines::Scraper.scrape_ranking_list
    MostCovetedCanines::Dog.create_canine_collection(array_of_hashes)
  end

  def add_puppy_properties
    array_of_hashes = MostCovetedCanines::Scraper.scrape_ranking_list
    MostCovetedCanines::Dog.assign_additional_attributes(array_of_hashes)
  end

  def welcome_user
    puts ""
    puts "*~*~*~*~*~* The 50 Most Popular Dog Breeds in the United States *~*~*~*~*~*".colorize(:green)
    puts ""
  end

  def unleash_dogs
    range_starts_at = ""
    puts "Enter one of the following ranges to view dogs within that ranking tier:"
    puts "1-10, 11-20, 21-30, 31-40, 41-50"
    range_starts_at = gets.strip.to_i

    if range_starts_at == 1 || range_starts_at == 11 || range_starts_at == 21 || range_starts_at == 31 || range_starts_at == 41
      reveal_range(range_starts_at)
      demand_dog(range_starts_at)
      pick_new_puppy
    else
      puts "The input you entered is invalid. Please try again.".colorize(:red)
      unleash_dogs
    end
  end

  def reveal_range(first_in_range)
    puts "Dogs Ranked from Numbers #{first_in_range} through #{first_in_range+9}:".colorize(:green)
    dogs_requested = MostCovetedCanines::Dog.all[first_in_range-1..first_in_range+8]
    dogs_requested.each.with_index(first_in_range) {|dog, i| puts "#{i}. #{dog.breed}"}
    puts ""
  end

  def demand_dog(first_in_range)
    input = ""
    puts "Enter the rank of the dog breed you'd like to explore further:"
    input = gets.strip

    if MostCovetedCanines::Dog.find_by_rank(input)
      if input.to_i.between?(first_in_range, first_in_range+9)
        showcase_dog(input)
      elsif input.to_i > (first_in_range+9)
        puts "Unfortunately, the dog breed that you requested did not make the cut for this ranking tier.".colorize(:blue)
        puts "Nevertheless, here's some useful information about the breed:".colorize(:blue)
        showcase_dog(input)
      else
        puts "Hot dog! The dog breed that you requested ranks higher in popularity!".colorize(:blue)
        puts "Here's some information about this impressive breed:".colorize(:blue)
        showcase_dog(input)
      end
    else
      puts "The input you entered is invalid. Please try again.".colorize(:red)
      demand_dog(first_in_range)
    end
  end

  def showcase_dog(rank)
    the_dog = MostCovetedCanines::Dog.find_by_rank(rank)
    puts "*~*~*~*~*~* #{the_dog.breed} *~*~*~*~*~*".colorize(:green)
    puts "Group:".colorize(:yellow) << " #{the_dog.group}"
    puts "Personality:".colorize(:yellow) << " #{the_dog.personality}"
    puts "Year Recognized by AKC:".colorize(:yellow) << " #{the_dog.year_recognized}"
    puts "Rank:".colorize(:yellow) << " #{the_dog.rank}"
    puts "Grooming:".colorize(:yellow) << " #{the_dog.grooming}"
    puts "Exercise:".colorize(:yellow) << " #{the_dog.exercise}"
    puts "Fun Fact:".colorize(:yellow) << " #{the_dog.fun_fact}"
    # here doc. I'm going to use #gsub with RegEx. I replace 0 or more spaces at the start of the line or 0 or more spaces at the end of the line with an empty string ""
    puts <<-DOC.gsub(/^\s*|$\s*/, "")
    #{"Appearance:".colorize(:yellow)} #{the_dog.appearance}
    DOC
    puts "*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*".colorize(:green)
    puts ""
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
      puts "The input you entered is invalid. Please type yes or no.".colorize(:red)
      pick_new_puppy
    end
  end
end
