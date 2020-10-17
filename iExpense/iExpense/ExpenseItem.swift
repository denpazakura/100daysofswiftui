//
//  ExpenseItem.swift
//  iExpense
//
//  Created by denpazakura on 17/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import SwiftUI

struct ExpenseItem: Identifiable, Decodable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}
