//
//  CompetitionModel.swift
//  4Sale
//
//  Created by Al-attar on 03/06/2023.
//

import Foundation

struct Area : Codable {
	let id : Int?
	let name : String?
	let countryCode : String?
	let ensignUrl : String?

	enum CodingKeys: String, CodingKey {
		case id = "id"
		case name = "name"
		case countryCode = "countryCode"
		case ensignUrl = "ensignUrl"
	}

}
