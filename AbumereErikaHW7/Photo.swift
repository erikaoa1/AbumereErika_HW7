//
//  Photo.swift
//  AbumereErikaHW7
//
//  Created by Student on 11/8/23.
//

import Foundation

struct PhotoUrl: Decodable {
    let raw: String //raw photo path
    let full: String //maximum dimensions
    let regular: String //jpg format in 1080 witdth
    let small: String //400 width
    let thumb: String //200 width
    
}

struct Photo: Decodable, Hashable {
    let id: String
    let urls: PhotoUrl
    
    
    static func == (lhs: Photo, rhs: Photo) -> Bool {
    return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
    hasher.combine(id)
    }
    
}
