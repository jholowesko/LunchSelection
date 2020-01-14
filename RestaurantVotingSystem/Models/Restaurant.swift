import Foundation


// MARK: - Restaurant Model:

struct Restuarant: Codable, Equatable {
    var restaurantName: String
    var numberOfVotes: Int
    var previewImage: String
    var didSelfVote: Bool
}


// MARK: - Default Arrays:

// Sample Data - For Testing Purposes
var sampleArray: [Restuarant] = [Restuarant(restaurantName: "Panera Bread", numberOfVotes: 4, previewImage: "image1", didSelfVote: false),
                                Restuarant(restaurantName: "Bob's Burgers", numberOfVotes: 0, previewImage: "image2", didSelfVote: false),
                                Restuarant(restaurantName: "Vegan's Delight", numberOfVotes: 5, previewImage: "image3", didSelfVote: false),
                                Restuarant(restaurantName: "Wok to Wok", numberOfVotes: 0, previewImage: "image4", didSelfVote: false),
                                Restuarant(restaurantName: "Chef's Table", numberOfVotes: 1, previewImage: "image5", didSelfVote: true),
                                Restuarant(restaurantName: "Starbucks", numberOfVotes: 0, previewImage: "image6", didSelfVote: false),
                                Restuarant(restaurantName: "Surfside", numberOfVotes: 1, previewImage: "image7", didSelfVote: false),
                                Restuarant(restaurantName: "Joe's Pizza", numberOfVotes: 2, previewImage: "image8", didSelfVote: false),
                                Restuarant(restaurantName: "Wild Wings", numberOfVotes: 0, previewImage: "image9", didSelfVote: false),
                                Restuarant(restaurantName: "Wine Time", numberOfVotes: 0, previewImage: "image10", didSelfVote: false)]

// All Votes and Bools Reset
var clearedArray: [Restuarant] = [Restuarant(restaurantName: "Panera Bread", numberOfVotes: 0, previewImage: "image1", didSelfVote: false),
                                 Restuarant(restaurantName: "Bob's Burgers", numberOfVotes: 0, previewImage: "image2", didSelfVote: false),
                                 Restuarant(restaurantName: "Vegan's Delight", numberOfVotes: 0, previewImage: "image3", didSelfVote: false),
                                 Restuarant(restaurantName: "Wok to Wok", numberOfVotes: 0, previewImage: "image4", didSelfVote: false),
                                 Restuarant(restaurantName: "Chef's Table", numberOfVotes: 0, previewImage: "image5", didSelfVote: false),
                                 Restuarant(restaurantName: "Starbucks", numberOfVotes: 0, previewImage: "image6", didSelfVote: false),
                                 Restuarant(restaurantName: "Surfside", numberOfVotes: 0, previewImage: "image7", didSelfVote: false),
                                 Restuarant(restaurantName: "Joe's Pizza", numberOfVotes: 0, previewImage: "image8", didSelfVote: false),
                                 Restuarant(restaurantName: "Wild Wings", numberOfVotes: 0, previewImage: "image9", didSelfVote: false),
                                 Restuarant(restaurantName: "Wine Time", numberOfVotes: 0, previewImage: "image10", didSelfVote: false)]
