import Foundation


// MARK: - Restaurant Model:

struct Restuarant: Codable, Equatable {
    var restaurantName: String
    var numberOfVotes: Int
    var previewImage: String
    var didSelfVote: Bool
}


    // Mock Voting Data
    var sampleArray: [Restuarant] = [Restuarant(restaurantName: "Restaurant 1", numberOfVotes: 4, previewImage: "image1", didSelfVote: false),
                                    Restuarant(restaurantName: "Restaurant 2", numberOfVotes: 0, previewImage: "image2", didSelfVote: false),
                                    Restuarant(restaurantName: "Restaurant 3", numberOfVotes: 5, previewImage: "image3", didSelfVote: false),
                                    Restuarant(restaurantName: "Restaurant 4", numberOfVotes: 0, previewImage: "image4", didSelfVote: false),
                                    Restuarant(restaurantName: "Restaurant 5", numberOfVotes: 1, previewImage: "image5", didSelfVote: true),
                                    Restuarant(restaurantName: "Restaurant 6", numberOfVotes: 0, previewImage: "image6", didSelfVote: false),
                                    Restuarant(restaurantName: "Restaurant 7", numberOfVotes: 1, previewImage: "image7", didSelfVote: false),
                                    Restuarant(restaurantName: "Restaurant 8", numberOfVotes: 2, previewImage: "image8", didSelfVote: false),
                                    Restuarant(restaurantName: "Restaurant 9", numberOfVotes: 0, previewImage: "image9", didSelfVote: false),
                                    Restuarant(restaurantName: "Restaurant 10", numberOfVotes: 0, previewImage: "image10", didSelfVote: false)]
