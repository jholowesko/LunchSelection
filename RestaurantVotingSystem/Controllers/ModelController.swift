import Foundation

class DepartmentController {
    
    
    // MARK: - Properties
    
    // Initialization Occured Boolean
    var firstInitalizationOccured: Bool {
        let userDefaults = UserDefaults.standard
        return userDefaults.bool(forKey: "InitializationOccured")
    }
    

    // MARK: - Initializer:
        
    // Sample Data Initialization
//    init() {
//        if firstInitalizationOccured == false {
//            resetSampleData()
//            let userDefaults = UserDefaults.standard
//            userDefaults.set(true, forKey: "InitializationOccured")
//            saveToPersistentStore()
//            print("Initial Initialize")
//        }
//        loadFromPersistentStore()
//        print("Loaded from Persistent Store")
//    }
        
        
    // MARK: - Functions
        
        // Reset Sample Data
        func resetSampleData() {
            marketingArray = sampleArray
            designArray = sampleArray
            financeArray = sampleArray
            print("Reset to Sample Data")
        }


    // MARK: - Persistent Storage:
        
        // Persistent Store URLs
        private var marketingURL: URL? {
            let fileManager = FileManager.default
            guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
            
            return documents.appendingPathComponent("MarketingArray.plist")
        }
        private var designURL: URL? {
            let fileManager = FileManager.default
            guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
            
            return documents.appendingPathComponent("DesignArray.plist")
        }
        private var financeURL: URL? {
            let fileManager = FileManager.default
            guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
            
            return documents.appendingPathComponent("FinanceArray.plist")
        }
        
        // Saving to Persistent Store
        func saveToPersistentStore() {
            guard let mUrl = marketingURL,
                let dUrl = designURL,
                let fUrl = financeURL else { return }
            
            do {
                let encoder = PropertyListEncoder()
                let mdata = try encoder.encode(marketingArray)
                try mdata.write(to: mUrl)
                let ddata = try encoder.encode(designArray)
                try ddata.write(to: dUrl)
                let fdata = try encoder.encode(financeArray)
                try fdata.write(to: fUrl)
            } catch {
                print("Error saving Restaurants data: \(error)")
            }
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
                
                marketingArray = try decoder.decode([Restuarant].self, from: mdata)
                designArray = try decoder.decode([Restuarant].self, from: ddata)
                financeArray = try decoder.decode([Restuarant].self, from: fdata)
            } catch {
                print("Error loading Restaurants data: \(error)")
            }
        }
    }

