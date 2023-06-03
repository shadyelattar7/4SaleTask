//
//  LeagueWorker.swift
//  4Sale
//
//  Created by Al-attar on 03/06/2023.
//

import Foundation
import Alamofire


enum LeagueNetworking: TargetType{
    case Competitions
}

extension LeagueNetworking{
    var path: String{
        switch self {
        case .Competitions:
            return "/competitions"
        }
    }
    
    var method: HTTPMethod{
        switch self{
        case .Competitions:
            return .get
        }
    }
    
    var task: Task{
        switch self{
        case .Competitions:
            return .requestPlain
        }
    }
    
    var headers: [String : String]{
        switch self {
        case .Competitions:
            return [:]
        }
        
    }
}
