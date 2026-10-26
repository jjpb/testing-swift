//
//  HomeViewModel.swift
//  pagilatestproject
//
//  Created by Jonathan Punongbayan on 10/26/26.
//

import Foundation
import Observation

@Observable
class HomeViewModel {
    var isLoading: Bool = false
    var films: [HomeFilmModel] = []
    var errorMessage: String?
    
    func fetchFilms() async {
        guard let url = URL(string: "http://localhost:8000/films/home/0/10") else {
            self.errorMessage = "Invalid URL"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let (data, response) = try await URLSession
                .shared
                .data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw URLError(.badServerResponse)
            }
            
            let decode = try JSONDecoder()
                .decode(
                    [HomeFilmModel].self,
                    from: data
                )
            
            self.films = decode
        } catch {
            self.errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
