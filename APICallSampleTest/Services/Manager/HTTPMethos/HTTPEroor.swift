//
//  HTTPEroor.swift
//  APICallSampleTest
//
//  Created by ankita khare on 10/07/22.
//

import Foundation

enum HTTPError: Error {
    case urlFailed
    case noData
    case requestError
    case parsingFailed
}
