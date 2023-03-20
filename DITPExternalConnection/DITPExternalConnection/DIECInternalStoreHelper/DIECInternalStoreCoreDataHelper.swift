//
//  DIECInternalStoreCoreDataHelper.swift
//  DITPExternalConnection
//
//  Created by Marcelo Aguilar Bravo on 20/03/23.
//

import Foundation
import CoreData

public class DIECInternalStoreCoreDataHelper {
    
    public static func registerInternalUserInfo(dataUser: [String : Any ], context: NSManagedObjectContext) {
        let users = getUserRegistered(with: context)
        if users.count != 0 {
            deletePreviousUser(with: context, user: users.first)
        }
        saveUserInfo(with: context, dataUser: dataUser)
    }
    private static func getUserRegistered(with context: NSManagedObjectContext) -> [NSManagedObject]  {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserInfo")
        guard let results = try? context.fetch(fetchRequest),
              let users = results as? [NSManagedObject]
        else {
            return []
        }
        return users
    }
    private static func deletePreviousUser(with context: NSManagedObjectContext, user: NSManagedObject?) {
        guard let user = user
        else { return }
        context.delete(user)
        do{ try context.save() } catch _ {/* error handling*/}
    }
    private static func saveUserInfo(with context: NSManagedObjectContext, dataUser: [String : Any ]) {
        do{
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "UserInfo", into: context)
            newUser.setValue(dataUser["email"],forKey:"email")
            newUser.setValue(dataUser["providerID"],forKey:"providerID")
            newUser.setValue(dataUser["uid"],forKey:"uid")
            try context.save()
        } catch _ {/* error handling*/}
    }
}
