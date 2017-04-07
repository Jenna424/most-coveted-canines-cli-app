class MostCovetedCanines::Dog
  attr_accessor :breed, :url, :group, :personality, :year_recognized, :rank, :grooming, :exercise, :fun_fact, :appearance
  @@all = []
  @@puppies = []

  def self.puppies #class reader
    @@puppies
  end

  def initialize(canine_hash)
    canine_hash.each {|k,v| self.send("#{k}=", v)}
    @@puppies << self
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
end
