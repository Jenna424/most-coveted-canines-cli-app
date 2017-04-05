Project Idea: A CLI that ranks the 50 most popular dog breeds in the United States, according to American Kennel Club.

Planning My Interface:
--welcome user
--list ranking tiers:
1-10, 11-20, 21-30, 31-40, 41-50
--prompt user to select a specific ranking tier
--display dogs (by rank and breed name) that are included in that particular tier, e.g.,
1. Retrievers (Labrador)
2. German Shepherd Dogs
3. Retrievers (Golden)
4. Bulldog
5. Beagle
6. French Bulldog
7. Poodle
8. Rottweiler
9. Yorkshire Terrier
10. Boxer
--prompt user to enter the rank number of the dog they want to explore further.
--display data about the dog (scraped attributes)
--if the user wants to view another dog breed, execute loop again to select rank and then an individual dog
--if the user does not want to view another dog breed, exit program

What is a dog?
A dog is an instance of the MostCovetedCanines::Dog class.
A dog instance has the following attributes represented as instance variables:
@breed, @url, @group, @personality, @year_recognized, @rank, @nutrition, @grooming, @exercise, @fun_fact and @appearance
