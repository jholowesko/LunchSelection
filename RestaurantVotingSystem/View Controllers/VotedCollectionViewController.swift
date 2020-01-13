import UIKit


class VotedCollectionViewController: UICollectionViewController {
    
    let restaurantController = RestaurantController()
    
    
    // MARK: - Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var selectedArray: [Restuarant] = []
    var filteredArray: [Restuarant] = []

    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filteredArray = selectedArray.filter { $0.numberOfVotes > 0 }
        let count = filteredArray.count
        return count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VotedCell", for: indexPath) as? RestaurantCollectionViewCell else { return UICollectionViewCell() }
    
        cell.restaurant = filteredArray[indexPath.item]
        
        return cell
    }
    
    
    // MARK: - UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedRestaurant = filteredArray[indexPath.row]
        guard let position = selectedArray.firstIndex(of: selectedRestaurant) else { return }
        
        if selectedArray[position].didSelfVote == true {
            selectedArray[position].numberOfVotes -= 1
            selectedArray[position].didSelfVote.toggle()
            restaurantController.marketingArray[position].didSelfVote.toggle()
        } else {
            selectedArray[position].numberOfVotes += 1
            selectedArray[position].didSelfVote.toggle()
            restaurantController.marketingArray[position].didSelfVote.toggle()
        }
        restaurantController.saveToPersistentStore()
        self.collectionView.reloadData()
        print(selectedArray[position])
        print(restaurantController.marketingArray[position])
    }
}
