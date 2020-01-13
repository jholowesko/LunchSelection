import UIKit


class GroupViewController: UIViewController {
    
    var restaurantController = RestaurantController()

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MarketingSegue" {
            if let selectedArray = segue.destination as? VotedCollectionViewController {
                selectedArray.selectedArray = restaurantController.marketingArray
            }
        }
        if segue.identifier == "DesignSegue" {
            if let selectedArray = segue.destination as? VotedCollectionViewController {
                selectedArray.selectedArray = restaurantController.designArray
            }
        }
        if segue.identifier == "FinanceSegue" {
            if let selectedArray = segue.destination as? VotedCollectionViewController {
                selectedArray.selectedArray = restaurantController.financeArray
            }
        }
    }
    
    
    // MARK: - IBActions
    
    @IBAction func refreshTapped(_ sender: Any) {
            let userDefaults = UserDefaults.standard
            userDefaults.set(false, forKey: "ShouldInitialize")
            restaurantController.saveToPersistentStore()
            self.loadView()
            print("Reset Initialize")
    }
}
