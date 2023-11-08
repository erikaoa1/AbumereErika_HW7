//
//  PhotosViewModel.swift
//  AbumereErikaHW7
//
//  Created by Student on 11/8/23.
//

import Foundation

class PhotosViewModel: ObservableObject {
    private let BASE_URL = "https://api.unsplash.com"
    private let ACCESS_KEY = "3yDUbbZKtvHFskZPpAdVhw8tF1ia3VwDez1dcqM2aWY"
    private let PHOTOS_COUNT = 20
    
    @Published var isLoading = false
    @Published var photos = [Photo]()
    
    func refresh() async {
        do {
            isLoading = true
            
            let url = URL(string: "\(BASE_URL)/photos/random?count=\(PHOTOS_COUNT)")!
            var request = URLRequest(url: url)
            request.setValue("Client-ID \(ACCESS_KEY)", forHTTPHeaderField: "Authorization")
            
            let (data, _) = try await URLSession.shared.data(from: request, delegate: nil)
            
            let decoder = JSONDecoder()
            let downloadedPhotos = try decoder.decode([Photo].self, from: data)
            
            photos = downloadedPhotos
        } catch {
            print("Error refreshing photos: \(error)")
        }
        
        isLoading = false
    }
}
