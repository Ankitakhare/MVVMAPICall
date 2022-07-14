//
//  Service.swift
//  APICallSampleTest
//
//  Created by ankita khare on 10/07/22.
//


import Foundation

class ServiceManager {
    public static let shared = ServiceManager()

    func callService<T: Decodable>(urlString: String, success: @escaping ((T) -> Void), fail: @escaping ((HTTPError) -> Void)) {
        let url = URL(string: urlString)
        guard let urlObj = url else {
            fail(.urlFailed)
            return
        }
        let session = URLSession.shared
        var request = URLRequest(url: urlObj)
        
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let task: URLSessionDataTask = session.dataTask(with: request as URLRequest, completionHandler: { data, _, error in

            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    fail(.noData)
                    return
                }
                let decoder = JSONDecoder()
                if let json = try? decoder.decode(T.self, from: data) {
                    success(json)
                } else {
                    fail(.parsingFailed)
                }
            }
        })
        task.resume()
    }
}
