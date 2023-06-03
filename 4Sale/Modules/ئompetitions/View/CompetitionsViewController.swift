//
//  CompetitionsViewController.swift
//  4Sale
//
//  Created by Al-attar on 02/06/2023.
//

import UIKit
import RxCocoa
import RxSwift
import CoreData

class CompetitionsViewController: BaseWireFrame<CompetitionsViewModel>, UIScrollViewDelegate {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var competitionsTableView: UITableView!
    
    //MARK: - Varabiles
    
    var CompetInCart: [CompetitionLeague] = []
    
    
    //MARK: - Bind
    
    override func bind(viewModel: CompetitionsViewModel) {
        viewModel.ViewDidLoad(view: self.view)
        setupView()
        registerCell()
        SetupCompetitionsTableView()
    }
    
    
    //MARK: - Private func
    
    private func setupView(){
        self.navigationItem.title = "Football Leagues"
    }
    
    private func registerCell(){
        competitionsTableView.registerNIB(cell: LeagueCell.self)
    }
    
    private func SetupCompetitionsTableView(){
        competitionsTableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        viewModel.competition.bind(to: competitionsTableView.rx.items(cellIdentifier: String(describing: LeagueCell.self), cellType: LeagueCell.self)){ (row,item,cell) in
            cell.configure(item)
        }.disposed(by: disposeBag)
        
        competitionsTableView.rx.itemSelected.subscribe { [weak self] indexPath in
            guard let self = self, let indexPath = indexPath.element else {return}
            print("IndexPath: \(indexPath)")
        }.disposed(by: disposeBag)
    }
    
    private func loadCompaition()  {
        let fetchRequest: NSFetchRequest<CompetitionLeague> = CompetitionLeague.fetchRequest()
        do{
            let result = try CoreDataStack.sharedInstance.persistentContainer.viewContext.fetch(fetchRequest) as [CompetitionLeague]
            CompetInCart = result
        }catch{
            print("Error , Sorry I can not fetch data from local storge")
        }
        
    }
    
    
}
