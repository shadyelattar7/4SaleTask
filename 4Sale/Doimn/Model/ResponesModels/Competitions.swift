//
//  CompetitionModel.swift
//  4Sale
//
//  Created by Al-attar on 03/06/2023.
//

import Foundation

 struct Competitions: Codable {
	let id : Int?
	let area : Area?
	let name : String?
	let code : String?
	let emblemUrl : String?
	let plan : String?
	let numberOfAvailableSeasons : Int?
	let lastUpdated : String?

	enum CodingKeys: String, CodingKey {
		case id = "id"
		case area = "area"
		case name = "name"
		case code = "code"
		case emblemUrl = "emblemUrl"
		case plan = "plan"
		case numberOfAvailableSeasons = "numberOfAvailableSeasons"
		case lastUpdated = "lastUpdated"
	}
}
