class MostCovetedCanines::Scraper
  # When a dog instance is instantiated, is it initialized with any attributes?
  # A dog instance will be initialized with @breed and @url attributes.
  # I will need to use the @url attribute to eventually scrape an individual dog's profile page
  # A dog instance will be initialized with a hash of keys that correspond to breed and url attributes. The hash values are the scraped data.
  def self.scrape_ranking_list
    # the return value of this method will be an array of hashes, and each dog instance will be initialized with one of these hash elements
    # stub out the local variable @array_of_hashes to an empty array
    @array_of_hashes = []
  end



end
