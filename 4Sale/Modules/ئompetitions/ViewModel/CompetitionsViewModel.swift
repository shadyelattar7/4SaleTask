//
//  CompetitionsViewModel.swift
//  4Sale
//
//  Created by Al-attar on 02/06/2023.
//

import Foundation
import RxSwift
import RxCocoa
import CoreData

//MARK: - ViewController -> ViewModel

protocol CompetitionsViewModelInputs{
    
}


//MARK: - ViewController <- ViewModel

protocol CompetitionsViewModelOutputs{
    var competition: BehaviorRelay<[Competitions]> {get set}

}
class CompetitionsViewModel: BaseViewModel{
    
    let competitions: LeagueWorkerProtocol
    let disposedBag = DisposeBag()
    
    
    init(competitions: LeagueWorkerProtocol) {
        self.competitions = competitions
    }
    
    //MARK: - Inputs
    
    func ViewDidLoad(view: UIView){
        fetchCompetitions(view: view)
    }
    
    //MARK: - Outputs
    
    var competition: BehaviorRelay<[Competitions]> = .init(value: [])
    
    //MARK: - API Call
    
    func fetchCompetitions(view: UIView){
        competitions.Competitions().subscribe(onNext:{ [weak self] result in
            guard let self = self else {return}
            switch result{
            case .success(let model):
                self.competition.accept(model.competitions ?? [])
                                
                model.competitions?.forEach({ Competition in
                    let compet = CompetitionLeague(context: CoreDataStack.sharedInstance.persistentContainer.viewContext)
                    compet.leagueName = Competition.name ?? ""
                    compet.logoURL = Competition.area?.ensignUrl ?? ""
                    CoreDataStack.sharedInstance.saveContext()
                })
            
                
            case .failure(let error):
                let errorMessage = error.userInfo["NSLocalizedDescription"] as! String
                ToastManager.shared.showToast(message: errorMessage, view: view, postion: .top , backgroundColor: .systemRed)
                print("ERROR: \(error)")
            }
        }).disposed(by: disposedBag)
    }
    
}
