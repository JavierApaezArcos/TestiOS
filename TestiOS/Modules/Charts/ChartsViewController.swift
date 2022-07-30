//
//  ChartsViewController.swift
//  TestiOS
//
//  Created by javier apaez on 30/07/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ChartsDisplayLogic: AnyObject
{
    func displayCharts(viewModel: Charts.ChartsData.ViewModel)
}

class ChartsViewController: UIViewController, ChartsDisplayLogic {
    var interactor: ChartsBusinessLogic?
    var router: (NSObjectProtocol & ChartsRoutingLogic & ChartsDataPassing)?
    let chartsView = ChartsView()

    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: - Setup Clean Code Design Pattern 

    private func setup() {
        let viewController = self
        let interactor = ChartsInteractor()
        let presenter = ChartsPresenter()
        let router = ChartsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: - Routing

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }

    // MARK: - View lifecycle
    
    override func loadView() {
        view = chartsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Gráficas"
        fetchChartsData()
//        doSomethingElse()
    }
    
    // MARK: - request data from ChartsInteractor

    func fetchChartsData() {
        let request = Charts.ChartsData.Request()
        interactor?.fetchChartsData(request: request)
    }

    // MARK: - display view model from ChartsPresenter

    func displayCharts(viewModel: Charts.ChartsData.ViewModel) {
        
    }
}
