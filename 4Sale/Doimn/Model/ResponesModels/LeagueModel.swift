//
//  CompetitionModel.swift
//  4Sale
//
//  Created by Al-attar on 03/06/2023.
//

import Foundation

struct League : Codable {
    let competitions : [Competitions]?

    enum CodingKeys: String, CodingKey {
        case competitions = "competitions"
    }
}
