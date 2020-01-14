import Foundation


// MARK: - Department Model:

struct OfficeDepartment: Codable, Equatable {
    var restaurantArray: [Restuarant]
    let departmentNumber: Int
}

