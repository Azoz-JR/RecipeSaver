//
//  Utilities.swift
//  Recipe
//
//  Created by Azoz Salah on 01/06/2023.
//

import Foundation
import UIKit

final class Utilities {
    // Shared instance of the Utilities class
    static let shared = Utilities()
    
    // Private initializer to prevent external instantiation
    private init() {}
    
    // MainActor function to retrieve the top view controller
    @MainActor
    func topViewController(controller: UIViewController? = nil) -> UIViewController? {
        // If no specific controller is provided, use the root view controller of the key window
        let controller = controller ?? UIApplication.shared.keyWindow?.rootViewController
        
        // Check if the current controller is a navigation controller
        if let navigationController = controller as? UINavigationController {
            // Recursively call the function with the visible view controller of the navigation controller
            return topViewController(controller: navigationController.visibleViewController)
        }
        
        // Check if the current controller is a tab bar controller
        if let tabController = controller as? UITabBarController {
            // Recursively call the function with the selected view controller of the tab bar controller
            return topViewController(controller: tabController.selectedViewController)
        }
        
        // Check if the current controller has a presented view controller
        if let presented = controller?.presentedViewController {
            // Recursively call the function with the presented view controller
            return topViewController(controller: presented)
        }
        
        // Return the current controller (topmost view controller)
        return controller
    }
}

