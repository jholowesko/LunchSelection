import Foundation

// MARK: - Restaurant Model:

struct Restuarant: Codable, Equatable {
    var restaurantName: String
    var numberOfVotes: Int
    var previewImage: String
    var hasBeenSuggested: Bool
    var didSelfVote: Bool
}

    // Array where "hasBeenSuggested" all set to false
    var clearedArray: [Restuarant] = [Restuarant(restaurantName: "Restaurant1", numberOfVotes: 0, previewImage: "image1",                                        hasBeenSuggested: false, didSelfVote: false),
                                  Restuarant(restaurantName: "Restaurant2", numberOfVotes: 0, previewImage: "image2", hasBeenSuggested: false, didSelfVote: false),
                                  Restuarant(restaurantName: "Restaurant3", numberOfVotes: 0, previewImage: "image3", hasBeenSuggested: false, didSelfVote: false),
                                  Restuarant(restaurantName: "Restaurant4", numberOfVotes: 0, previewImage: "image4", hasBeenSuggested: false, didSelfVote: false),
                                  Restuarant(restaurantName: "Restaurant5", numberOfVotes: 0, previewImage: "image5", hasBeenSuggested: false, didSelfVote: false),
                                  Restuarant(restaurantName: "Restaurant6", numberOfVotes: 0, previewImage: "image6", hasBeenSuggested: false, didSelfVote: false),
                                  Restuarant(restaurantName: "Restaurant7", numberOfVotes: 0, previewImage: "image7", hasBeenSuggested: false, didSelfVote: false),
                                  Restuarant(restaurantName: "Restaurant8", numberOfVotes: 0, previewImage: "image8", hasBeenSuggested: false, didSelfVote: false),
                                  Restuarant(restaurantName: "Restaurant9", numberOfVotes: 0, previewImage: "image9", hasBeenSuggested: false, didSelfVote: false),
                                  Restuarant(restaurantName: "Restaurant10", numberOfVotes: 0, previewImage: "image10", hasBeenSuggested: false, didSelfVote: false)]

    // Array of mock voting data.
    var sampleArray: [Restuarant] = [Restuarant(restaurantName: "Restaurant1", numberOfVotes: 3, previewImage: "image1",                                        hasBeenSuggested: true, didSelfVote: false),
                                 Restuarant(restaurantName: "Restaurant2", numberOfVotes: 0, previewImage: "image2", hasBeenSuggested: false, didSelfVote: false),
                                 Restuarant(restaurantName: "Restaurant3", numberOfVotes: 0, previewImage: "image3", hasBeenSuggested: false, didSelfVote: false),
                                 Restuarant(restaurantName: "Restaurant4", numberOfVotes: 4, previewImage: "image4", hasBeenSuggested: true, didSelfVote: false),
                                 Restuarant(restaurantName: "Restaurant5", numberOfVotes: 2, previewImage: "image5", hasBeenSuggested: true, didSelfVote: false),
                                 Restuarant(restaurantName: "Restaurant6", numberOfVotes: 0, previewImage: "image6", hasBeenSuggested: false, didSelfVote: false),
                                 Restuarant(restaurantName: "Restaurant7", numberOfVotes: 1, previewImage: "image7", hasBeenSuggested: true, didSelfVote: false),
                                 Restuarant(restaurantName: "Restaurant8", numberOfVotes: 0, previewImage: "image8", hasBeenSuggested: false, didSelfVote: false),
                                 Restuarant(restaurantName: "Restaurant9", numberOfVotes: 1, previewImage: "image9", hasBeenSuggested: true, didSelfVote: false),
                                 Restuarant(restaurantName: "Restaurant10", numberOfVotes: 0, previewImage: "image10", hasBeenSuggested: false, didSelfVote: false)]
