//
//  Model.swift
//  APICallSampleTest
//
//  Created by ankita khare on 09/07/22.
//

import Foundation

class Model: Decodable {
    let id: Int?
    let transactionDate: String?
    let summary: String?
    let debit: Double?
    let credit:Double?
}

/*struct TransactionData: Decodable {
    var list: [Model]
}*/
