//
//  FellowModel.swift
//  Fellows
//
//  Created by Ashlee Krammer on 1/5/18.
//  Copyright © 2018 Ashlee Krammer. All rights reserved.
//

import Foundation

struct Fellow: Codable {
    let name: String
    let imageURL: URL?
    let bio: String?
}
