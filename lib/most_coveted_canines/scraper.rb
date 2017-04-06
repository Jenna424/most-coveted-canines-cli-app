class MostCovetedCanines::Scraper
  # When a dog instance is instantiated by Dog class, the instance will be initialized with a hash of keys and values
  # The keys of each hash will be @breed and @url attributes (represented as :breed and :url symbols in hash)
  # The corresponding values will be the scraped data
  # Eventually, I will need to use the value of the @url property to scrape an individual dog's profile page
  def self.scrape_ranking_list
    # The return value of this method will be an array of hashes. A dog instance will be initialized with a hash element from array
    array_of_hashes = []
    # the #open method returns the HTML content of the web page specified in the argument
    # the Nokogiri::HTML method converts this into a giant HTML nested node string
    # the local variable node_set will store this giant nested node HTML string of ranking list web page
    node_set = Nokogiri::HTML(open(http://www.akc.org/content/news/articles/most-popular-dog-breeds-full-ranking-list/))
  end
end
