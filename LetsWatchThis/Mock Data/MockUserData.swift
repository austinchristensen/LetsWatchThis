////
////  MockUserData.swift
////  LetsWatchThis
////
////  Created by Austin Christensen on 4/12/21.
////
//
//import Foundation
//
//struct MockUserData {
//    let movies = [
//        MediaItem(title: "School of Rock", id: UUID(), isCompleted: false, description: "Overly enthusiastic guitarist Dewey Finn (Jack Black) gets thrown out of his bar band and finds himself in desperate need of work. Posing as a substitute music teacher at an elite private elementary school, he exposes his students to the hard rock gods he idolizes and emulates -- much to the consternation of the uptight principal (Joan Cusack). As he gets his privileged and precocious charges in touch with their inner rock 'n' roll animals, he imagines redemption at a local Battle of the Bands.", type: .movie, imagePath: "imagePlaceholder"),
//        MediaItem(title: "Yesterday", id: UUID(), isCompleted: false, description: "Jack Malik is a struggling singer-songwriter in an English seaside town whose dreams of fame are rapidly fading, despite the fierce devotion and support of his childhood best friend, Ellie. After a freak bus accident during a mysterious global blackout, Jack wakes up to discover that The Beatles have never existed. Performing songs by the greatest band in history to a world that has never heard them, Jack becomes on overnight sensation with a little help from his agent.", type: .movie, imagePath: "imagePlaceholder"),
//        MediaItem(title: "Secret Life of Walter Mitty", id: UUID(), isCompleted: false, description: "Walter Mitty (Ben Stiller), an employee at Life magazine, spends day after monotonous day developing photos for the publication. To escape the tedium, Walter inhabits a world of exciting daydreams in which he is the undeniable hero. Walter fancies a fellow employee named Cheryl (Kristen Wiig) and would love to date her, but he feels unworthy. However, he gets a chance to have a real adventure when Life's new owners send him on a mission to obtain the perfect photo for the final print issue.", type: .movie, imagePath: "imagePlaceholder"),
//        MediaItem(title: "Spirited Away", id: UUID(), isCompleted: false, description: "In this animated feature by noted Japanese director Hayao Miyazaki, 10-year-old Chihiro (Rumi Hiiragi) and her parents (Takashi Naitô, Yasuko Sawaguchi) stumble upon a seemingly abandoned amusement park. After her mother and father are turned into giant pigs, Chihiro meets the mysterious Haku (Miyu Irino), who explains that the park is a resort for supernatural beings who need a break from their time spent in the earthly realm, and that she must work there to free herself and her parents.", type: .movie, imagePath: "imagePlaceholder"),
//        MediaItem(title: "Sound of Music", id: UUID(), isCompleted: false, description: "A tuneful, heartwarming story, it is based on the real life story of the Von Trapp Family singers, one of the world's best-known concert groups in the era immediately preceding World War II. Julie Andrews plays the role of Maria, the tomboyish postulant at an Austrian abbey who becomes a governess in the home of a widowed naval captain with seven children, and brings a new love of life and music into the home.", type: .movie, imagePath: "imagePlaceholder"),
//        MediaItem(title: "The Shining", id: UUID(), isCompleted: true, description: "Jack Torrance (Jack Nicholson) becomes winter caretaker at the isolated Overlook Hotel in Colorado, hoping to cure his writer's block. He settles in along with his wife, Wendy (Shelley Duvall), and his son, Danny (Danny Lloyd), who is plagued by psychic premonitions. As Jack's writing goes nowhere and Danny's visions become more disturbing, Jack discovers the hotel's dark secrets and begins to unravel into a homicidal maniac hell-bent on terrorizing his family.", type: .movie, imagePath: "imagePlaceholder"),
//        MediaItem(title: "JoJo Rabbit", id: UUID(), isCompleted: true, description: "Jojo is a lonely German boy who discovers that his single mother is hiding a Jewish girl in their attic. Aided only by his imaginary friend -- Adolf Hitler -- Jojo must confront his blind nationalism as World War II continues to rage on.", type: .movie, imagePath: "imagePlaceholder"),
//        MediaItem(title: "Die Hard", id: UUID(), isCompleted: true, description: "New York City policeman John McClane (Bruce Willis) is visiting his estranged wife (Bonnie Bedelia) and two daughters on Christmas Eve. He joins her at a holiday party in the headquarters of the Japanese-owned business she works for. But the festivities are interrupted by a group of terrorists who take over the exclusive high-rise, and everyone in it. Very soon McClane realizes that there's no one to save the hostages -- but him.", type: .movie, imagePath: "imagePlaceholder"),
//        MediaItem(title: "Shawshank Redemption", id: UUID(), isCompleted: true, description: "Andy Dufresne (Tim Robbins) is sentenced to two consecutive life terms in prison for the murders of his wife and her lover and is sentenced to a tough prison. However, only Andy knows he didn't commit the crimes. While there, he forms a friendship with Red (Morgan Freeman), experiences brutality of prison life, adapts, helps the warden, etc., all in 19 years.", type: .movie, imagePath: "imagePlaceholder"),
//        MediaItem(title: "The Departed", id: UUID(), isCompleted: true, description: "South Boston cop Billy Costigan (Leonardo DiCaprio) goes under cover to infiltrate the organization of gangland chief Frank Costello (Jack Nicholson). As Billy gains the mobster's trust, a career criminal named Colin Sullivan (Matt Damon) infiltrates the police department and reports on its activities to his syndicate bosses. When both organizations learn they have a mole in their midst, Billy and Colin must figure out each other's identities to save their own lives.", type: .movie, imagePath: "imagePlaceholder")
//    ]
//    let shows = [
//        MediaItem(title: "Futurama", id: UUID(), isCompleted: false, description: "The series follows the adventures of slacker Philip J. Fry, who is cryogenically preserved for 1000 years and is revived in the 31st century. Fry finds work at an interplanetary delivery company, working alongside the one-eyed Leela and robot Bender.", type: .show, imagePath: "imagePlaceholder"),
//        MediaItem(title: "The Simpsons", id: UUID(), isCompleted: false, description: "The Simpsons are a dysfunctional family living in Springfield. Homer, the man of the house, is a safety inspector at the nuclear power plant. Homer constantly spends most of his time at Moe's Tavern getting drunk. Marge is a hard-working housewife with three children.", type: .show, imagePath: "imagePlaceholder"),
//        MediaItem(title: "The Great British Bake Off", id: UUID(), isCompleted: false, description: "The Great British Bake Off (often abbreviated to Bake Off or GBBO) is a British television baking competition, produced by Love Productions, in which a group of amateur bakers compete against each other in a series of rounds, attempting to impress a group of judges with their baking skills.", type: .show, imagePath: "imagePlaceholder"),
//        MediaItem(title: "It's Always Sunny in Philadelphia", id: UUID(), isCompleted: true, description: "Four egocentric friends run a bar together in Philadelphia and love to revel in each other's misery.", type: .show, imagePath: "imagePlaceholder"),
//        MediaItem(title: "Breaking Bad", id: UUID(), isCompleted: true, description: "A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his family's future.", type: .show, imagePath: "imagePlaceholder"),
//        MediaItem(title: "Marriage of Mortgage", id: UUID(), isCompleted: false, description: "Married or single, we've all heard it. \"You could buy a house for the price of that wedding!\" But have you ever stopped to think, what if you actually did?", type: .show, imagePath: "imagePlaceholder"),
//        MediaItem(title: "Avatar the Last Airbender", id: UUID(), isCompleted: false, description: "The series is centered around the journey of 12-year-old Aang, the current Avatar and last survivor of his nation, the Air Nomads, along with his friends Katara, Sokka, and later Toph, as they strive to end the Fire Nation's war against the other nations of the world.", type: .show, imagePath: "imagePlaceholder"),
//        MediaItem(title: "Dragonball Z", id: UUID(), isCompleted: true, description: "After learning that he is from another planet, a warrior named Goku and his friends are prompted to defend it from an onslaught of extraterrestrial enemies.", type: .show, imagePath: "imagePlaceholder"),
//        MediaItem(title: "The Boys", id: UUID(), isCompleted: false, description: "A group of vigilantes set out to take down corrupt superheroes who abuse their superpowers.", type: .show, imagePath: "imagePlaceholder"),
//        MediaItem(title: "Rugrats", id: UUID(), isCompleted: false, description: "The cartoon misadventures of four babies and their snotty older cousin as they face the things in life they don't understand.", type: .show, imagePath: "imagePlaceholder")
//    ]
//    let books = [
//        MediaItem(title: "Animal Farm", id: UUID(), isCompleted: true, description: "Animal Farm is an allegorical novella by George Orwell, first published in England on 17 August 1945. The book tells the story of a group of farm animals who rebel against their human farmer, hoping to create a society where the animals can be equal, free, and happy.", type: .book, imagePath: "imagePlaceholder"),
//        MediaItem(title: "World War Z", id: UUID(), isCompleted: false, description: "World War Z is a novel by Max Brooks which depicts a fictional outbreak of the Solanum virus in China during the mid-2000s. It shows the social, economic, political, cultural, technological, and ecological effects of a zombie apocalypse", type: .book, imagePath: "imagePlaceholder"),
//        MediaItem(title: "Harry Potter and the Sorcerers Stone", id: UUID(), isCompleted: false, description: "Harry Potter and the Philosopher's Stone is an enthralling start to Harry's journey toward coming to terms with his past and facing his future. It was the first book written by Rowling, and she was praised for creating well-rounded characters and a fully realized wizard universe that coexisted with the present world.", type: .book, imagePath: "imagePlaceholder"),
//        MediaItem(title: "American Psycho", id: UUID(), isCompleted: false, description: "American Psycho is a satire that is both entertaining and frightening, opening reader's eyes to the consequences of apathy in society. Patrick Bateman and his friend, Tim Price, are on their way to dinner at Evelyn's, Bateman's girlfriend, house. Price is talking non-stop, a result of too many steroids.", type: .book, imagePath: "imagePlaceholder"),
//        MediaItem(title: "Jurassic Park", id: UUID(), isCompleted: false, description: "Jurassic Park is a 1990 science fiction novel written by Michael Crichton. A cautionary tale about genetic engineering, it presents the collapse of an amusement park showcasing genetically re-created dinosaurs to illustrate the mathematical concept of chaos theory and its real world implications.", type: .book, imagePath: "imagePlaceholder"),
//        MediaItem(title: "1984", id: UUID(), isCompleted: false, description: "In George Orwell's 1984, Winston Smith wrestles with oppression in Oceania, a place where the Party scrutinizes human actions with ever-watchful Big Brother. Defying a ban on individuality, Winston dares to express his thoughts in a diary and pursues a relationship with Julia. These criminal deeds bring Winston into the eye of the opposition, who then must reform the nonconformist. George Orwell's 1984 introduced the watchwords for life without freedom: BIG BROTHER IS WATCHING YOU.", type: .book, imagePath: "imagePlaceholder"),
//        MediaItem(title: "The Great Gatsby", id: UUID(), isCompleted: false, description: "The Great Gatsby is a 1925 novel by American writer F. Scott Fitzgerald. Set in the Jazz Age on Long Island, the novel depicts narrator Nick Carraway's interactions with mysterious millionaire Jay Gatsby and Gatsby's obsession to reunite with his former lover, Daisy Buchanan.", type: .book, imagePath: "imagePlaceholder"),
//        MediaItem(title: "Of Mice and Men", id: UUID(), isCompleted: false, description: "Of Mice and Men is a novella written by John Steinbeck.[1][2] Published in 1937, it narrates the experiences of George Milton and Lennie Small, two displaced migrant ranch workers, who move from place to place in California in search of new job opportunities during the Great Depression in the United States.", type: .book, imagePath: "imagePlaceholder"),
//        MediaItem(title: "Frankenstein", id: UUID(), isCompleted: false, description: "Frankenstein; or, The Modern Prometheus is an 1818 novel written by English author Mary Shelley. Frankenstein tells the story of Victor Frankenstein, a young scientist who creates a sapient creature in an unorthodox scientific experiment.", type: .book, imagePath: "imagePlaceholder"),
//        MediaItem(title: "The Giver", id: UUID(), isCompleted: false, description: "The Giver is a 1993 American young adult dystopian novel by Lois Lowry. It is set in a society which at first appears to be utopian but is revealed to be dystopian as the story progresses. The novel follows a 12-year-old boy named Jonas.", type: .book, imagePath: "imagePlaceholder")
//    ]
//}
