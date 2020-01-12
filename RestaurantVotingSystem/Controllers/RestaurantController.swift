import Foundation

class RestaurantControlller {
    
    
    // MARK: - Properties
    
    // Sample Data for Initial Run
    var firstInitalizationOccured: Bool {
        let userDefaults = UserDefaults.standard
        return userDefaults.bool(forKey: "ShouldInitialize")
    }
    

    
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
    
    var marketingArray: [Restuarant] = []
    var designArray: [Restuarant] = []
    var financeArray: [Restuarant] = []


    // MARK: - Initializer:
    
    // loading from Persistent store
    // Sample Data Initialization
    init() {
        if firstInitalizationOccured == false {
            resetSampleData()
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: "ShouldInitialize")
            saveToPersistentStore()
            print("Initial Initialize")
        }
        loadFromPersistentStore()
        print("Loaded from Persistent Store")
    }
    
    
    // MARK: - Functions
    
    // Reset Sample Data
    func resetSampleData() {
        marketingArray = sampleArray
        designArray = sampleArray
        financeArray = sampleArray
        print("Sample Data Reset")
    }
    
    // Clear Current Data
    func clearCurrentData() {
        marketingArray = clearedArray
        designArray = clearedArray
        financeArray = clearedArray
        print("Cleared all Restaurants")
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
