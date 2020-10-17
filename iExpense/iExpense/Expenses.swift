//
//  Expenses.swift
//  iExpense
//
//  Created by denpazakura on 17/10/2020.
//  Copyright © 2020 denpazakura. All rights reserved.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
