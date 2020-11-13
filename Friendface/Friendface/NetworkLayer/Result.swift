//
//  Result.swift
//  Friendface
//
//  Created by denpazakura on 13/11/2020.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}
