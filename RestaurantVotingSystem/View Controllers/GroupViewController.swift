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
}
