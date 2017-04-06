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
    [dog_1]
  end
end
