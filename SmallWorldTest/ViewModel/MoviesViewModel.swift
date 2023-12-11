//
//  MoviesViewModel.swift
//  SmallWorldTest
//
//  Created by Sabih Haris on 11/12/2023.
//

import Foundation
import Combine

class MoviesViewModel : ObservableObject {
    
    @Published var moviesList  = [MovieResult]()
    
    let service : ContentService
    var cancellable = Set<AnyCancellable>()
    
    
    init(service:ContentService) {
        self.service = service
        getData()
    }
    
    func getData() {
        service.getMoviesData()
            .sink { completion in
                switch completion {
                case .finished:
                    print("completed")
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] response in
                self?.moviesList = response.results ?? []
            }
            .store(in: &cancellable)
        
    }
}
