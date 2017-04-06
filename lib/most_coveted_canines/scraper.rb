class MostCovetedCanines::Scraper
  #scrape the main full ranking list AKC page to obtain @breed and @url attributes that each dog instance is initialized with
  def self.scrape_ranking_list #the return value of this class method will be an array of hashes
    array_of_hashes = []
    node_set = Nokogiri::HTML(open("http://www.akc.org/content/news/articles/most-popular-dog-breeds-full-ranking-list/?button"))
    # #open method returns the HTML content of AKC web page specified in argument
    # Nokogiri::HTML method converts this HTML content into giant nested node HTML string
    # node_set variable will store this giant nested node HTML string
    # below, call the #search method on node_set with the following css selector:
    # go inside <div class="content" to grab the <a> tags, where each <a> tag will contain an individual dog's profile link
    # the #search method returns an array-like collection of Nokogiri::XML 'dog' elements
    # dogs ranked from numbers 1-50 are represented by 'array' indices 0 through 49
    # save this array-like collection of 50 Nokogiri XML 'dog' elements to canine_xml_elements variable
    canine_xml_elements = node_set.search("div.content a")[0..49]
    canine_xml_elements.each do |canine|
      canine_hash = {}
      canine_hash[:breed] = canine.text
      canine_hash[:url] = canine.attr("href")
      array_of_hashes << canine_hash
    end
    array_of_hashes
    binding.pry
  end
end
