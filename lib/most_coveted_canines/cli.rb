class MostCovetedCanines::CLI

  def call
    # writing the code I wish I had:
    # I wish I had a method called #make_puppies that will return to me the array of newly instantiated puppy instances with @breed and @url attributes
    make_puppies
    # writing the code I wish I had:
    # I wish I had a method called #add_puppy_properties that will add attributes to the 'puppies', aka dog instances instantiated with only @breed and @url
    # and these grown, 'mature' dog instances that now contain ALL of their attributes will be stored in @@all array in Dog class:
    add_puppy_properties
    welcome_user
    unleash_dogs
  end

  #define the #make_puppies method below:
  def make_puppies
    array_of_hashes = MostCovetedCanines::Scraper.scrape_ranking_list
    # the above class method will return an array of hashes where each hash corresponds to a particular dog instance
    # and contains that dog instance's @breed and @url attribute key/value pairs
    MostCovetedCanines::Dog.create_canine_collection(array_of_hashes)
    # the above class method called on Dog class will take in an argument that is the return value of #scrape_ranking_list
    # It will return an array @@new_puppies of newly instantiated puppies (dog instances) that each have only 2 attributes: breed and url
  end # The last line of #make_puppies is the method call to #create_canine_collection(array_of_hashes) # Therefore, the return value of #make_puppies is my array of newly instantiated dog instances that each have @breed and @url attributes

  def add_puppy_properties
    array_of_hashes = MostCovetedCanines::Scraper.scrape_ranking_list
    # I have a method defined in my Dog class called #assign_additional_attributes, which assigns the additional properties to the dog instances
    # and then pushes those dog instances into @@all array of all 'mature' dog instances with all of their attributes set
    MostCovetedCanines::Dog.assign_additional_attributes(array_of_hashes)
    # What is array_of_hashes? The return value of #scrape_ranking_list method!
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
      demand_dog(range_starts_at)
      pick_new_puppy
    else
      puts "The input you entered is invalid. Please try again."
      unleash_dogs
    end
  end

  def reveal_range(first_in_range)
    puts "Dogs Ranked from Numbers #{first_in_range} through #{first_in_range + 9}:"
    dogs_requested = MostCovetedCanines::Dog.all[first_in_range-1..first_in_range+8]
    dogs_requested.each.with_index(first_in_range) {|dog, i| puts "#{i}. #{dog.breed}"}
    puts ""
    # I want to add a space between listing the dogs in that particular ranking tier and printing the command to ask the user to enter a specific rank number
  end

  def demand_dog(first_in_range)# demand dog takes in an argument of an INTEGER number which is the first number within the range. For example, if the user wants to view dogs ranked 1-10, the first_in_range variable = 1
    input = nil
    puts "Enter the rank of the dog breed you'd like to explore further:"
    input = gets.strip # self reminder: here, input is a STRING number rank, such as "1" or "50"
    # first, see if the input number a user has entered even corresponds to a dog instance!
    if MostCovetedCanines::Dog.find_by_rank(input) # that is, if a dog instance is found with that @rank and does NOT evaluate to nil, execute the following logic:
    # rather than just seeing if the dog instance exists in that collection of all 50 dog instances,
    # I'm going to be more specific and check to make sure the dog instance is included in the range of ranks the user requested earlier
      if input.to_i.between?(first_in_range, first_in_range+9)
      # I want to display that dog's data, so I need to call #showcase_dog(input) method
        showcase_dog(input) # I'm going to make the argument of showcase_dog the string rank number the user entered
    # what happens if the string rank number (converted to an integer) that the user entered is GREATER THAN > the last number in the requested range? (but still within the range of 1-50)?
    # for example, if the user selected the range of dogs ranked 1-10 and the user mistakenly entered "24", converted to the integer 24,
    # the dog instance the user requested has a lower popularity ranking. The smaller the number, the HIGHER the popularity ranking. For example, the labrador retriever at rank 1 is MOST popular.
    # I want to inform the user that the dog breed they requested did NOT make the cut for this ranking tier since it's less popular, But
    # since the dog exists in the top 50, I will still display data about the dog, i.e. 'showcase' the dog.
      elsif input.to_i > (first_in_range+9) #first_in_range+9 is the highest number in the range
        puts "Unfortunately, the dog breed that you requested did not make the cut for this ranking tier."
        puts "Nevertheless, here's some useful information about the breed:"
        showcase_dog(input)
      else
      # If the user enters a number that is lower than first_in_range, I will notify the user that the dog breed actually ranks higher in popularity,
      # but I will still display the dog breed's data anyway:
        puts "Hot dog! The dog breed you requested ranks higher in popularity!"
        puts "Here's some information about this impressive breed:"
        showcase_dog(input)
      end
    else #  If the dog instance does not exist, print error message
      puts "The input you entered is invalid. Please try again."
      demand_dog(first_in_range)
    end
  end

  def showcase_dog(rank)
    # The spacing of the value for the @appearance attribute of a dog instance needs to be fixed
    # The @appearance attribute value was scraped from a paragraph element on an individual dog's profile page
    # This value is basically just a giant string. I'll need to fix the spacing and
    # to do so, I think I'll use a here doc
    # Also, I want to create some sort of visual separation between the different categories of data, the different attributes
    # To do so, I think I'll change the text colors
    # Let me start by first requiring colorize in my environment file, lib/most_coveted_canines.rb
    # I want to see if that worked...I'm going to make line 108 (printing the dog's breed) green
    # I'll call the #colorize method on the string with an argument of the color I want (:green) as a symbol
    # I forgot to add colorize as a dependency in my gemspec file ...let's do that now!
    # That worked! Now the dog breed is printed in green text!
    # I'm going to test out the color red for the different attributes, but the values for each attribute will remain as white text
    # That worked, but I'm going to try yellow rather than red (because red is very bright) and I need to add a space before the value for group attribute
    # That worked! Let's change the rest of the attributes to yellow and be sure to add a space before the values! I'll use << shovel operator instead of + to join the strings
    # Looks good! Now I have to fix the spacing for a dog's appearance data
    # I want to remove 0 or more spaces at the start of a line or 0 or more spaces at the end of a line
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
      puts "The input you entered is invalid. Please type yes or no."
      pick_new_puppy
    end
  end
end
