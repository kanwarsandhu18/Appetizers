//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Kanwar Sandhu on 2024-08-04.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }

        task.resume()
    }
    
//    func getAppetizers() async throws -> [Appetizer] {
//            guard let url = URL(string: appetizerURL) else {
//                throw APError.invalidURL
//            }
//            
//            let (data, _) = try await URLSession.shared.data(from: url)
//            if let dataString = String(data: data, encoding: .utf8) {
//                    print("Response data: \(dataString)")
//                }
//            
//            do {
//                    let decoder = JSONDecoder()
//                    let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
//                    return decodedResponse.request
//                } catch {
//                    print("Decoding error: \(error)")
//                    throw APError.unableToComplete
//                }
//        }
    
}