class MostCovetedCanines::Dog

  attr_accessor :breed, :url, :group, :personality, :year_recognized, :rank, :grooming, :exercise, :fun_fact, :appearance
  @@all = []

  def initialize(canine_hash)
    canine_hash.each {|k,v| self.send("#{k}=", v)}
  end

  def self.create_canine_collection(array_of_hashes)
    array_of_hashes.collect {|canine_hash| self.new(canine_hash)}
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.assign_additional_attributes(array_of_hashes)
    puppies_born = self.create_canine_collection(array_of_hashes)
    puppies_born.each do |puppy|
      puppy_properties = MostCovetedCanines::Scraper.scrape_puppy_profile(puppy.url)
      puppy_properties.each do |k,v|
        puppy.send("#{k}=", v)
      end
      puppy.save
    end
  end

  def self.find_by_rank(rank)
    @@all.detect {|dog| dog.rank == rank}
  end

end
