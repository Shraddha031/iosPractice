import Foundation

class CustomersModel {
    var address: String?
    var city: String?
    var companyName: String?
    var contactName: String?
    var contactTitle: String?
    var country: String?
    var customerID: String?
    var phone: String?
    
    init(data: [String: Any]) {
        if let address = data["Address"] as? String {
            self.address = String(address)
        }
        if let city = data["City"] as? String {
            self.city = String(city)
        }
        if let companyName = data["CompanyName"] as? String {
            self.companyName = String(companyName)
        }
        if let contactName = data["ContactName"] as? String {
            self.contactName = String(contactName)
        }
        if let contactTitle = data["ContactTitle"] as? String {
            self.contactTitle = String(contactTitle)
        }
        if let country = data["Country"] as? String {
            self.country = String(country)
        }
        if let customerID = data["CustomerID"] as? String {
            self.customerID = String(customerID)
        }
        if let phone = data["Phone"] as? String {
            self.phone = String(phone)
        }
    }
}


