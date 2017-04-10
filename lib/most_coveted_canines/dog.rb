class MostCovetedCanines::Dog
  attr_accessor :breed, :url, :group, :personality, :year_recognized, :rank, :grooming, :exercise, :fun_fact, :appearance
  @@all = []

# I am going to refactor my Dog class a bit.
# Currently, a dog instance is initialized with a hash, where the 2 keys of :breed and :url (@breed and @url attributes) correspond to values scraped from the AKC's full ranking list main page
# I use mass assignment to call #breed=() and #url=() instance setter methods on the dog instance that is instantiated to set its @breed and @url attributes
# I then push (shovel) the new dog instance with its @breed and @url attributes assigned into the @@new_puppies array
# @@new_puppies will contain all of the newly instantiated dog instances that each have only TWO attributes of breed and url
# Later, I iterate through @@new_puppies in #assign_additional_attributes(array_of_canine_hashes) class method to add more properties to the dog instances
# Instead of creating two separate arrays @@new_puppies and @@all (the latter contains fully 'mature' dogs with ALL attributes assigned)
# I'm going to eliminate @@new_puppies. I don't want to have 2 separate arrays to store dog instances
# I'm going to start by removing @@new_puppies set to empty array on line 4 and the class reader #puppies called on Dog class to retrieve class variable @@new_puppies!
  def initialize(canine_hash)
    canine_hash.each {|k,v| self.send("#{k}=", v)}
    @@new_puppies << self
  end
  # Instead of iterating through the array_of_hashes, where each hash will represent an individual dog instance's data for @breed and @url attributes, and instantiating a dog instance with that hash and then returning the @@new_puppies array at the end of the method,
  # I want to simply create a new array to return right then and there where my array elements become the dog instances themselves with their attributes of breed and url assigned
  # Instead of #each, Im going to use the #collect method (which is synonymous with #map) to return this new modified array:

  def self.create_canine_collection(array_of_hashes) # argument is return value of Scraper#scrape_ranking_list
    array_of_hashes.collect {|canine_hash| self.new(canine_hash)}
  end

  # Now, the return value of #create_canine_collection(array_of_hashes) will automatically be an array of dog instances where each dog instance element has a @breed and @url attribute
  # When #new is called, #initialize is automatically called (hook)
  # And in initialize method, the dog instance had its @breed and @url attributes set through mass assignment. The dog instance was initialized with that canine hash
  # an example of a canine_hash would be {:breed => "Retrievers (Labrador)", :url => "labrador retriever's profile url web address goes here"}

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.assign_additional_attributes(array_of_canine_hashes)
    puppies_born = self.create_canine_collection(array_of_canine_hashes)
    puppies_born.each do |puppy|
      puppy_properties = MostCovetedCanines::Scraper.scrape_puppy_profile(puppy.url)
      puppy_properties.each do |k,v|
        puppy.send("#{k}=", v)
      end
      puppy.save
    end
  end

  # Below I will define a class method called on the MostCovetedCanines::Dog class to retrieve a dog instance specified by the rank number the user has entered
  # self in class scope of class method refers to the class itself
  #@@all is the array of all dog instances that have all of their attributes set, including @rank
  # I use #detect to go through that @@all array of all dog instances and find the first dog instance that
  # makes the block evaluate to true.
  # I call the instance getter method #rank on the dog instance to retrieve its @rank attribute and
  # I return the first dog instance whose @rank attribute is equal to the rank number passed into the method as an argument.
  # Self reminder: the rank argument will be a string number, such as "1" or "50". So I might have to convert that to an integer in different methods.
  # Now let's go back to the CLI class...
  # If no dog instance makes the block evaluage to true, #detect returns nil. Therefore, #find_by_rank(rank) will return nil
  def self.find_by_rank(rank) #class finder
    @@all.detect {|dog| dog.rank == rank}
  end
end
