import Foundation


class ModelController {
    
    
    // MARK: - Properties
    
    // Default Departments
    var emptyDepartment: OfficeDepartment = OfficeDepartment(restaurantArray: clearedArray, departmentNumber: 0)
    var marketingDepartment: OfficeDepartment = OfficeDepartment(restaurantArray: sampleArray, departmentNumber: 1)
    var designDepartment: OfficeDepartment = OfficeDepartment(restaurantArray: sampleArray, departmentNumber: 2)
    var financeDepartment: OfficeDepartment = OfficeDepartment(restaurantArray: sampleArray, departmentNumber: 3)

    
    // MARK: - Initializer:
        
    // InitializationOccured (Bool)
    var firstInitalizationOccured: Bool {
        let userDefaults = UserDefaults.standard
        return userDefaults.bool(forKey: "InitializationOccured")
    }
    
    // Sample Data (Init)
    init() {
        if firstInitalizationOccured == false {
            resetSampleData()
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: "InitializationOccured")
            print("Initial Initialize")
            saveToPersistentStore()
        }
        loadFromPersistentStore()
        print("Init(modelController) from loaded storage")
    }
        
    
    // MARK: - Functions
    
    // Reset Sample Data
    func resetSampleData() {
        marketingDepartment.restaurantArray = sampleArray
        designDepartment.restaurantArray = sampleArray
        financeDepartment.restaurantArray = sampleArray
        print("Reset Sample Data")
        saveToPersistentStore()
    }
    
    // Clear Data
    func clearSampleData() {
        marketingDepartment.restaurantArray = clearedArray
        designDepartment.restaurantArray = clearedArray
        financeDepartment.restaurantArray = clearedArray
        print("Cleared Sample Data")
        saveToPersistentStore()
    }
    
    // Toggle Department Restaurant
    func toggleDepartmentRestaurant(array: OfficeDepartment, positionInArray: Int) {
        let departmentNumber = array.departmentNumber
        switch departmentNumber {
        case 1:
            if array.restaurantArray[positionInArray].didSelfVote == true {
                marketingDepartment.restaurantArray[positionInArray].numberOfVotes -= 1
                marketingDepartment.restaurantArray[positionInArray].didSelfVote.toggle()
            } else {
                marketingDepartment.restaurantArray[positionInArray].numberOfVotes += 1
                marketingDepartment.restaurantArray[positionInArray].didSelfVote.toggle()
            }
        case 2:
            if array.restaurantArray[positionInArray].didSelfVote == true {
                designDepartment.restaurantArray[positionInArray].numberOfVotes -= 1
                designDepartment.restaurantArray[positionInArray].didSelfVote.toggle()
            } else {
                designDepartment.restaurantArray[positionInArray].numberOfVotes += 1
                designDepartment.restaurantArray[positionInArray].didSelfVote.toggle()
            }
        case 3:
            if array.restaurantArray[positionInArray].didSelfVote == true {
                financeDepartment.restaurantArray[positionInArray].numberOfVotes -= 1
                financeDepartment.restaurantArray[positionInArray].didSelfVote.toggle()
            } else {
                financeDepartment.restaurantArray[positionInArray].numberOfVotes += 1
                financeDepartment.restaurantArray[positionInArray].didSelfVote.toggle()
            }
        default:
            print("No Matched Departments")
            return
        }
        print("Toggled item in corresponding department")
        saveToPersistentStore()
    }


    // MARK: - Persistent Storage:
        
        // Persistent Store URLs
        private var marketingURL: URL? {
            let fileManager = FileManager.default
            guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
            
            return documents.appendingPathComponent("MarketingDepartment.plist")
        }
        private var designURL: URL? {
            let fileManager = FileManager.default
            guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
            
            return documents.appendingPathComponent("DesignDepartment.plist")
        }
        private var financeURL: URL? {
            let fileManager = FileManager.default
            guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
            
            return documents.appendingPathComponent("FinanceDepartment.plist")
        }
        
        // Saving to Persistent Store
        func saveToPersistentStore() {
            guard let mUrl = marketingURL,
                let dUrl = designURL,
                let fUrl = financeURL else { return }
            
            do {
                let encoder = PropertyListEncoder()
                let mdata = try encoder.encode(marketingDepartment)
                try mdata.write(to: mUrl)
                let ddata = try encoder.encode(designDepartment)
                try ddata.write(to: dUrl)
                let fdata = try encoder.encode(financeDepartment)
                try fdata.write(to: fUrl)
            } catch {
                print("Error saving departments' data: \(error)")
            }
            print("Saved to Persistent Ran")
        }
        
        // Loading from Persistent Store
        func loadFromPersistentStore() {
            let fileManager = FileManager.default
            guard let mUrl = marketingURL,
                let dUrl = designURL,
                let fUrl = financeURL,
                fileManager.fileExists(atPath: mUrl.path),
                fileManager.fileExists(atPath: dUrl.path),
                fileManager.fileExists(atPath: fUrl.path) else { return }
            
            do {
                let mdata = try Data(contentsOf: mUrl)
                let ddata = try Data(contentsOf: dUrl)
                let fdata = try Data(contentsOf: fUrl)
                
                let decoder = PropertyListDecoder()
                
                marketingDepartment = try decoder.decode(OfficeDepartment.self, from: mdata)
                designDepartment = try decoder.decode(OfficeDepartment.self, from: ddata)
                financeDepartment = try decoder.decode(OfficeDepartment.self, from: fdata)
            } catch {
                print("Error loading Departments' data: \(error)")
            }
            print("Loaded from Persistent Store Ran")
        }
    }

