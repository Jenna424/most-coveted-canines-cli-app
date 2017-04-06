class MostCovetedCanines::Dog
  attr_accessor :breed, :url, :group, :personality, :year_recognized, :rank, :grooming, :exercise, :fun_fact, :appearance
  @@all = []

  def self.all
    # returns array of all dog instances
    dog_1 = MostCovetedCanines::Dog.new
    dog_1.breed = "Retrievers (Labrador)"
    dog_1.url = "http://www.akc.org/dog-breeds/labrador-retriever/"
    dog_1.group = "Sporting Group"
    dog_1.personality = "Friendly, Active, Outgoing"
    dog_1.year_recognized = "1917"
    dog_1.rank = "1"
    dog_1.grooming = "A double-coated breed which sheds seasonally, regular grooming keeps his coat at its water-resistant best."
    dog_1.exercise = "Very Active; Labs are high-spirited and not afraid to show it."
    dog_1.fun_fact = "There are three acceptable colors in Labradors: Black, yellow and chocolate"
    dog_1.appearance = "The Labrador Retriever is a strongly built, medium-sized, short-coupled, dog possessing a sound, athletic, well-balanced conformation that enables it to function as a retrieving gun dog; the substance and soundness to hunt waterfowl or upland game for long hours under difficult conditions; the character and quality to win in the show ring; and the temperament to be a family companion. Physical features and mental characteristics should denote a dog bred to perform as an efficient Retriever of game with a stable temperament suitable for a variety of pursuits beyond the hunting environment. The most distinguishing characteristics of the Labrador Retriever are its short, dense, weather resistant coat; an 'otter' tail; a clean-cut head with broad back skull and moderate stop; powerful jaws; and its 'kind,' friendly eyes, expressing character, intelligence and good temperament."

    dog_2 = MostCovetedCanines::Dog.new
    dog_2.breed = "German Shepherd Dogs"
    dog_2.url = "http://www.akc.org/dog-breeds/german-shepherd-dog/"
    dog_2.group = "Herding Group"
    dog_2.personality = "Smart, Confident, Courageous"
    dog_2.year_recognized = "1908"
    dog_2.rank = "2"
    dog_2.grooming = "The breed's thick double short coat requires regular weekly grooming with a pin brush and slicker brush."
    dog_2.exercise = "Very Active; These big guys were born to work; they require regular mental and physical exercise."
    dog_2.fun_fact = "The German Shepherd Dog is one of the most popular and recognizable breeds of the AKC."
    dog_2.appearance = "The first impression of a good German Shepherd Dog is that of a strong, agile, well muscled animal, alert and full of life. It is well balanced, with harmonious development of the forequarter and hindquarter. The dog is longer than tall, deep-bodied, and presents an outline of smooth curves rather than angles. It looks substantial and not spindly, giving the impression, both at rest and in motion, of muscular fitness and nimbleness without any look of clumsiness or soft living. The ideal dog is stamped with a look of quality and nobility - difficult to define, but unmistakable when present. Secondary sex characteristics are strongly marked, and every animal gives a definite impression of masculinity or femininity, according to its sex."
    [dog_1, dog_2]
  end
end
