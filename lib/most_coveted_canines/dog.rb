class MostCovetedCanines::Dog
  attr_accessor :breed, :url, :group, :personality, :year_recognized, :rank, :grooming, :exercise, :fun_fact, :appearance
  @@all = []
  @@new_puppies = []

  def self.puppies #class reader
    @@new_puppies
  end

  def initialize(canine_hash)
    canine_hash.each {|k,v| self.send("#{k}=", v)}
    @@new_puppies << self
  end

  def self.create_canine_collection(array_of_hashes) # argument is return value of Scraper#scrape_ranking_list
    array_of_hashes.each {|canine_hash| self.new(canine_hash)}
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.assign_additional_attributes
    @@new_puppies.each do |puppy|
      puppy_properties = MostCovetedCanines::Scraper.scrape_puppy_profile(puppy.url)
      puppy_properties.each do |k,v|
        puppy.send("#{k}=", v)
      end
      puppy.save
    end
  end
end
