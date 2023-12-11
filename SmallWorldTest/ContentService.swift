//
//  ContentService.swift
//  SmallWorldTest
//
//  Created by Sabih Haris on 11/12/2023.
//

import Foundation
import Combine

class ContentService {
    
    var cancellable = Set<AnyCancellable>()
    
    func getMoviesData() -> Future<MovieResponse,ErrorCodes> {
        
        return Future { promise in
            guard let url = URL(string: "\(ApiEndpoints.getAllMovies)?api_key=\(ApiKey.key)") else {
                return promise(.failure(.networkError(description: "Invalid URL")))
            }
            
            URLSession.shared.dataTaskPublisher(for: url)
                .receive(on: DispatchQueue.main)
                .tryMap {(data,response) in
                    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                        throw ErrorCodes.networkError(description: "Invalid Response")
                    }
                    return data
                }
            
                .decode(type: MovieResponse.self, decoder: JSONDecoder())
                .sink { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print(error)
                    }
                    
                    promise(.failure(.parsingError(description: "Parsing Error")))
                } receiveValue: { response in
                    promise(.success(response))
                }
                .store(in: &self.cancellable)
        }
    }
}


enum ErrorCodes : Error {
    case networkError(description:String)
    case parsingError(description:String)
}
