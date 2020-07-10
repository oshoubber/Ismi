//
//  APIResponses.swift
//  Ismi
//
//  Created by Osama on 7/8/20.
//  Copyright © 2020 Osama. All rights reserved.
//

import Foundation

// MARK: API Responses

struct GenderResponse: Codable {
    let name: String
    let gender: String
    let probability: Float
    let count: Int
}

struct AgifyResponse: Codable {
    let name: String
    let age: Int
    let count: Int
}

struct NationalizeResponse: Codable {
    let name: String
    let country: [Country]
}

// MARK: - Country
struct Country: Codable {
    let countryID: String
    let probability: Double

    enum CodingKeys: String, CodingKey {
        case countryID = "country_id"
        case probability
    }
}


