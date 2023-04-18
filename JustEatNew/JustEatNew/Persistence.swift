//
//  Persistence.swift
//  JustEatNew
//
//  Created by Shraddha on 15/02/23.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "JustEatNew")
        context = container.viewContext
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    func save(){
        do{
            try context.save()
        } catch{
            print("Error")
        }
    }
    func saveUser(data: [String: String]){
        let user = User(context: context)
        user.email = data["email"]
        user.name = data["name"]
        user.password = data["password"]
        user.dob = data["dob"]
        save()
    }
    func saveCartItems(data: [String: Any]){
        let cart = Cart(context: context)
        cart.cartId = data["cartId"] as? String
        cart.name = data["name"] as? String
        cart.qauntity = 1
        cart.isVeg = data["veg"] as! String == "true" ? true : false
        cart.price = data["price"] as? String
        cart.user = data["user"] as? User
        cart.distance = data["distance"] as? String
        cart.user?.restaurantId = data["currentRestaurant"] as? String
        save()
    }
    func deleteCartItems(item: Cart){
        context.delete(item)
        save()
    }
}


//    static var preview: PersistenceController = {
//        let result = PersistenceController(inMemory: true)
//        let viewContext = result.container.viewContext
//        for _ in 0..<10 {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//        }
//        do {
//            try viewContext.save()
//        } catch {
//
//            let nsError = error as NSError
//            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//        }
//        return result
//    }()
