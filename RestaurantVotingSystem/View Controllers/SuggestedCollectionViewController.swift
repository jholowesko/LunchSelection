import UIKit

// Delegate Protocol
protocol SuggestedCVCDelegate {
    func updateViews()
}

class SuggestedCollectionViewController: UICollectionViewController {

    // Instance of Model Controller
    let modelController = ModelController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Protocol Delegate
    var delegate: SuggestedCVCDelegate?

    
        // MARK: - Properties
    
    var selectedDepartmentNumber: Int = 0
    var selectedDepartment: OfficeDepartment {
        switch selectedDepartmentNumber {
        case 1:
            return modelController.marketingDepartment
        case 2:
            return modelController.designDepartment
        case 3:
            return modelController.financeDepartment
        default:
            print("Returning Empty Department")
            return modelController.emptyDepartment
        }
    }
    var filteredArray: [Restuarant] = []
    
    
        // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filteredArray = selectedDepartment.restaurantArray.filter { $0.numberOfVotes == 0 }
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
            guard let position = selectedDepartment.restaurantArray.firstIndex(of: selectedRestaurant) else { return }
            modelController.toggleDepartmentRestaurant(array: selectedDepartment, positionInArray: position)
            print("Selected ~ \(selectedRestaurant)")
            self.collectionView.reloadData()
            print("Colection View Reloaded")
            modelController.saveToPersistentStore()
            delegate?.updateViews()
            print("Calling UpdateViews on Delegate")
        }
    }
