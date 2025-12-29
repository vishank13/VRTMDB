//
//  NetworkManager.swift
//  tmdb
//
//  Created by Vishank Raghav on 18/11/23.
//

import Foundation
/*
class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    private let baseURLString = "https://api.themoviedb.org/3/"
    
    private let  headers = [
        "accept": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYzkwZGQ5NDY4NWJlNjg4Zjc1MzE2ZjJlNWMzOTA3NyIsInN1YiI6IjY1NTg3N2QwZWE4NGM3MTA5MzAyMjlmMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ._iznVfL2j9wIaqeJR0pox1fe3KlX81QS_NZRHGDux88"
    ]
    
    private let lang = "language=en-US"
    
    func makeRequest<T: Codable>(req: BaseRequestProtocol,
                                 path: String,
                                 completion: @escaping ((T)->Void)) {
        
//        let finalString = "\(baseURLString)\(path)\(req.paramString)?\(lang)"
        let finalString = "\(baseURLString)\(path)\(req.paramString)"
       
        let request = NSMutableURLRequest(url: NSURL(string: finalString)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if (error != nil) {
                debugPrint(error as Any)
            } else {
                guard let httpResponse = response as? HTTPURLResponse,
                      200..<300 ~= httpResponse.statusCode,
                      let data else {
                    debugPrint("Error in status code")
                    return
                }
                
                if let json = try? JSONDecoder().decode(T.self, from: data) {
                    print("\n :::::::::::::::::::::::::::")
                    debugPrint("REQUEST PATH: \(finalString)")
                    debugPrint("RESPONSE STATUS CODE: \(httpResponse.statusCode)")
                    print("RESPONSE DATA----------")
                    print(String(data: data, encoding: .utf8) ?? "")
                    print("::::::::::::::::::::::::::: \n")
                    completion(json)
                } else {
                    print("FAILED TO DECODE!!!!! \(path)")
                }
            }
        }
        
        dataTask.resume()
    }
}
*/

//
//  NetworkManager.swift
//  tmdb
//
//  Created by Vishank Raghav on 18/11/23.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
        
    private let  headers = [
        "accept": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYzkwZGQ5NDY4NWJlNjg4Zjc1MzE2ZjJlNWMzOTA3NyIsInN1YiI6IjY1NTg3N2QwZWE4NGM3MTA5MzAyMjlmMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ._iznVfL2j9wIaqeJR0pox1fe3KlX81QS_NZRHGDux88"
    ]
        
    func makeRequest<T: Codable>(req: BaseRequestProtocol,
                                 completion: @escaping ((T)->Void)) {
       
        guard let url = req.url else {
            print("invalid URL")
            return
        }
        
        let request = NSMutableURLRequest(url: url,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if (error != nil) {
                debugPrint(error as Any)
            } else {
                guard let httpResponse = response as? HTTPURLResponse,
                      200..<300 ~= httpResponse.statusCode,
                      let data else {
                    debugPrint("Error in status code")
                    return
                }
                
                if let json = try? JSONDecoder().decode(T.self, from: data) {
                    print("\n :::::::::::::::::::::::::::")
                    debugPrint("REQUEST PATH: \(url)")
                    debugPrint("RESPONSE STATUS CODE: \(httpResponse.statusCode)")
                    print("RESPONSE DATA----------")
                    print(String(data: data, encoding: .utf8) ?? "")
                    print("::::::::::::::::::::::::::: \n")
                    completion(json)
                } else {
                    print("FAILED TO DECODE!!!!! \(url)")
                }
            }
        }
        
        dataTask.resume()
    }
}
