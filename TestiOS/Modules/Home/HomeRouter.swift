//
//  HomeRouter.swift
//  TestiOS
//
//  Created by javier apaez on 29/07/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol HomeRoutingLogic {
    func routeToCharts()
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {
    
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
    
    // MARK: Routing (navigating to other screens)
    
    func routeToCharts() {
        let destinationVC = ChartsViewController()
        var destinationDS = destinationVC.router!.dataStore!
        passDataToCharts(source: dataStore!, destination: &destinationDS)
        navigateToSomewhere(source: viewController!, destination: destinationVC)
    }
    
    // MARK: Navigation to other screen
    
    func navigateToSomewhere(source: HomeViewController, destination: ChartsViewController) {
        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data to other screen
    
    func passDataToCharts(source: HomeDataStore, destination: inout ChartsDataStore) {
        
    }
}
