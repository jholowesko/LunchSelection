import UIKit


class RestaurantCollectionViewCell: UICollectionViewCell {
    
    
    // MARK: - IBOutlets
    
    @IBOutlet var restaurantNameLabel: UILabel!
    @IBOutlet var numberOfVotesLabel: UILabel!
    @IBOutlet var votedLabel: UILabel!
    @IBOutlet var restaurantImage: UIImageView!
    
    
    // When restaurant is Set -> Update Cell Content.
    var restaurant: Restuarant? {
        didSet {
            updateViews()
        }
    }
    
    
    // MARK: - Functions
    
    // Update views when cell is configured.
    func updateViews() {
        restaurantNameLabel.text = restaurant?.restaurantName
        numberOfVotesLabel.text = String("Votes (\(restaurant!.numberOfVotes))")
        votedLabel.text = votedString(didSelfVote: restaurant!.didSelfVote)
        restaurantImage.image = UIImage(named: restaurant!.previewImage)
    }
    
    // Swithing between "Voted" & "Vote"
    func votedString(didSelfVote: Bool) -> String {
        if didSelfVote {
            votedLabel.backgroundColor = UIColor.blue
            return "Voted"
        } else {
            votedLabel.backgroundColor = UIColor.systemGreen
            return "Tap to Vote"
        }
    }
}
