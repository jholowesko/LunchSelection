import UIKit


class GroupViewController: UIViewController {
    
    // Instance of Model Controller
    let modelController = ModelController()
    
    
    // MARK: - IBOutlets
    @IBOutlet var marketingButton: UIButton!
    @IBOutlet var designButton: UIButton!
    @IBOutlet var financeButton: UIButton!
    @IBOutlet var clockLabel: UILabel!
    @IBOutlet var triggerNotificationButton: UIBarButtonItem!
    @IBOutlet var resetDataButton: UIBarButtonItem!
    
    // Stylize Buttonss
    func stylizeButtons() {
        marketingButton.layer.cornerRadius = 30
        designButton.layer.cornerRadius = 30
        financeButton.layer.cornerRadius = 30
        resetDataButton.image = UIImage(systemName: "arrow.clockwise.circle.fill")
        triggerNotificationButton.image = UIImage(systemName: "quote.bubble.fill")
    }
    
    
    // Timer Object
    var timer = Timer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stylizeButtons()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.tick), userInfo: nil, repeats: true)
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
    }
    
    @objc func tick() {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        var placeholder: String {
            if minutes < 10 {
                return "0"
            } else {
                return ""
            }
        }
        clockLabel.text = "\(hour):\(placeholder)\(minutes)"
        if hour == 11 && minutes == 0 {
            triggerNotification()
        }
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MarketingSegue" {
            if let votedCVC = segue.destination as? VotedCollectionViewController {
                votedCVC.selectedDepartmentNumber = 1
                print("MarketingSegue Set Selected Department")
            }
        }
        if segue.identifier == "DesignSegue" {
            if let votedCVC = segue.destination as? VotedCollectionViewController {
                votedCVC.selectedDepartmentNumber = 2
                print("DesignSegue Set Selected Department")
            }
        }
        if segue.identifier == "FinanceSegue" {
            if let votedCVC = segue.destination as? VotedCollectionViewController {
                votedCVC.selectedDepartmentNumber = 3
                print("FinanceSegue Set Selected Department")
            }
        }
    }
    
    
    // MARK: - IBActions
    
    @IBAction func refreshTapped(_ sender: Any) {
        modelController.resetSampleData()
    }
    @IBAction func notificationTriggerTapped(_ sender: UIBarButtonItem) {
        triggerNotification()
    }
    
    // Function Trigger Notification
    func triggerNotification() {
        let mDepartmentWinner = winnerWinner(deparment: modelController.marketingDepartment)
        let dDepartmentWinner = winnerWinner(deparment: modelController.designDepartment)
        let fDepartmentWinner = winnerWinner(deparment: modelController.financeDepartment)
        
        let content = UNMutableNotificationContent()
        content.badge = 1
        content.body = """
                        Marketing Department top choice: \(mDepartmentWinner)!
                        Design Department top choice: \(dDepartmentWinner)!
                        Finance Department top choice: \(fDepartmentWinner)!
                        """
        content.subtitle = "The votes have been casted."
        content.title = "TIMES UP!"
         
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
         
        //creating the request
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    
    // Function to find winning Restaurants
    func winnerWinner(deparment: OfficeDepartment) -> String {
        let SortedArray = deparment.restaurantArray.sorted(by: { $0.numberOfVotes > $1.numberOfVotes })
        
        let winner = SortedArray[0].restaurantName
        
        return winner
    }
}
