//
//  MainNavigator.swift
//  Link-Me
//
//  Created by Al-attar on 10/05/2023.
//

import Foundation
import UIKit

class MainNavigator: Navigator{
    
    var coordinator: Coordinator
    
    
    enum Destination{
        case League
    }
    
    required init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    
    func viewcontroller(for destination: Destination) -> UIViewController {
        switch destination{
        case .League:
            let competitionsRepo = LeagueWorker()
            let viewModel = CompetitionsViewModel(competitions: competitionsRepo)
            let view = CompetitionsViewController(viewModel: viewModel, coordinator: coordinator)
            return view
        }
    }
}
