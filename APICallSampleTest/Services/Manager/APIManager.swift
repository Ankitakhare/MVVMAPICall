//
//  APIManager.swift
//  APICallSampleTest
//
//  Created by ankita khare on 10/07/22.
//

import Foundation


class APIManager {
    public static let shared = APIManager()

    func retrieveTransaction(success: @escaping (([Model]) -> Void), fail: @escaping ((HTTPError) -> Void)) {
        ServiceManager.shared.callService(urlString: Constant.URLString) { (response: [Model]) in
            success(response)
            print("successfull")
            print(response)
        } fail: { error in
            fail(error)
        }
    }
}
