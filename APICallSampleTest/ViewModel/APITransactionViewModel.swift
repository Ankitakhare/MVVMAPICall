//
//  APITransactionViewModel.swift
//  APICallSampleTest
//
//  Created by ankita khare on 10/07/22.
//

import Foundation

class APITransactionViewModel: APICallViewModel {
    var transLoaded: (([Model]?, Bool) -> Void)?
    var transList: [Model]?

    override func callService() {
        APIManager.shared.retrieveTransaction { [weak self] response in
            self?.transList = response
            self?.handleResponse(response: response, success: true)
        } fail: { [weak self] _ in
            self?.handleResponse(response: nil, success: false)
        }
    }

    private func handleResponse(response: [Model]?, success: Bool) {
        if let transLoaded = self.transLoaded {
            transLoaded(response, success)
        }
    }

    func numberOrRows() -> Int {
        return self.transList?.count ?? 0
    }

    func getTrans(index: Int) -> Model? {
        return self.transList?[index]
    }
}
