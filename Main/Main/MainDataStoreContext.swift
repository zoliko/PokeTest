//
//  MainDataStoreContext.swift
//  Main
//
//  Created by Marcelo Aguilar Bravo on 20/03/23.
//

import UIKit
import CoreData
public extension UIViewController {
    
    func  getCoreDataContext() -> NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
        else {
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }
    
}
