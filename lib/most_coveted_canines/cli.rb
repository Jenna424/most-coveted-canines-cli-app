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
      case range_starts_at
      when 1
        reveal_range(1)
        demand_dog
        pick_new_puppy
      when 11
        reveal_range(11)
        demand_dog
        pick_new_puppy
      when 21
        reveal_range(21)
        demand_dog
        pick_new_puppy
      when 31
        reveal_range(31)
        demand_dog
        pick_new_puppy
      when (41)
        reveal_range(41)
        demand_dog
        pick_new_puppy
      end
    else
      puts "The input you entered is invalid. Please try again."
      unleash_dogs
    end
  end
# In my Dog class, my @@all array stores all dog instances (that have all attributes assigned)
# I'm now going to replace my hard-coded string data in the #reveal_range method with my actual dog instances the Dog class created
# First, I'm going to remove my case statement in #reveal_range(first_in_range) that contains the hard-coded strings
  def reveal_range(first_in_range)
    @all_dogs = MostCovetedCanines::Dog.all
    puts "Dogs Ranked from Numbers #{first_in_range} through #{first_in_range + 9}:"
    # ultimately, this method should first get array of dog instances at specific array indices
    # then iterate through that array of dog instances and for each dog instance, print rank number followed by breed attribute
    # There are 10 numbers in each range, so the first number in the range + 9 is the last number in the range
  end

  def demand_dog
    input = nil
    puts "Enter the rank of the dog breed you'd like to explore further:"
    input = gets.strip

    if input.to_i.between?(1, 50)
      the_dog = @all_dogs[input.to_i - 1]
      showcase_dog(the_dog)
    else
      puts "The input you entered is invalid. Please try again."
      demand_dog
    end
  end

  def showcase_dog(the_dog)
    puts "*~*~*~*~*~* #{the_dog.breed} *~*~*~*~*~*"
    puts "Group: #{the_dog.group}"
    puts "Personality: #{the_dog.personality}"
    puts "Year Recognized by AKC: #{the_dog.year_recognized}"
    puts "Rank: #{the_dog.rank}"
    puts "Grooming: #{the_dog.grooming}"
    puts "Exercise: #{the_dog.exercise}"
    puts "Fun Fact: #{the_dog.fun_fact}"
    puts "Appearance: #{the_dog.appearance}"
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
