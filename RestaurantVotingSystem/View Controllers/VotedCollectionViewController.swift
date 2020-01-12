import UIKit


class VotedCollectionViewController: UICollectionViewController {
    
    var restaurantController = RestaurantControlller()
    
    // MARK: - Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var selectedArray: [Restuarant] = []
    var filteredArray: [Restuarant] = []

    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filteredArray = restaurantController.marketingArray.filter { $0.hasBeenSuggested }
        let count = filteredArray.count
        return count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VotedCell", for: indexPath)
        return cell
    }
    
    // MARK: - IBActions
    @IBAction func refreshTapped(_ sender: Any) {
        restaurantController.resetSampleData()
        restaurantController.saveToPersistentStore()
        collectionView.reloadData()
        print("Refresh Tapped")
    }
    @IBAction func trashTapped(_ sender: Any) {
        restaurantController.clearCurrentData()
        restaurantController.saveToPersistentStore()
        collectionView.reloadData()
        print("Trash Tapped")
    }
}
