class MostCovetedCanines::Scraper

  def self.scrape_ranking_list
    array_of_hashes = []
    node_set = Nokogiri::HTML(open("http://www.akc.org/content/news/articles/most-popular-dog-breeds-full-ranking-list/?button"))
    canine_xml_elements = node_set.search("div.content a")[0..49]
    canine_xml_elements.each do |canine|
      canine_hash = {}
      canine_hash[:breed] = canine.text
      canine_hash[:url] = canine.attr("href")
      array_of_hashes << canine_hash
    end
    array_of_hashes
  end

  def self.scrape_puppy_profile(puppy)
    puppy_profile = Nokogiri::HTML(open(puppy.url))
    #puppy_properties = {}
    puppy.group = puppy_profile.search("span.title").text
    puppy.personality = puppy_profile.search("span.adj").text
    puppy.year_recognized = puppy_profile.search("span.bigyear").text
    puppy.rank = puppy_profile.search("div.bigrank").text.gsub(/[^\d]/, "")
    puppy.grooming = puppy_profile.search("div.care-item")[1].search("p").text.gsub("Read More", "")
    puppy.exercise = puppy_profile.search("div.care-item")[2].search("p").text.gsub("Read More", "")
    puppy.fun_fact = puppy_profile.search("#didYouKnow p").text
    puppy.appearance = puppy_profile.search("div.tip-container p").text
    #puppy_properties
  end

end
