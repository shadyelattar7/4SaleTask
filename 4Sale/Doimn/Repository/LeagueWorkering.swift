//
//  LeagueWorkering.swift
//  4Sale
//
//  Created by Al-attar on 03/06/2023.
//

import Foundation
import RxSwift

protocol LeagueWorkerProtocol{
    
    /// it is the method used to get all Competitions
    /// - Parameters:
    ///   - params:
    /// - Returns: Competitions model
    func Competitions() -> Observable<Result<League, NSError>>
    
}


class LeagueWorker: APIClient<LeagueNetworking>, LeagueWorkerProtocol{
    func Competitions() -> Observable<Result<League, NSError>> {
        self.performRequest(target: .Competitions)
    }
}
