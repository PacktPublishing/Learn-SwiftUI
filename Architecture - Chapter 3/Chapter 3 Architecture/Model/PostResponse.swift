//
//  DataModel.swift
//  Chapter 3 Architecture
//
//  Created by Chris Barker on 12/11/2019.
//  Copyright © 2019 Packt. All rights reserved.
//

import UIKit

struct PostResponse: Codable {
    let userId: Int
    let id: Int?
    let title: String?
    let body: String?
}
