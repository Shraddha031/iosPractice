//
//  MovieModel.swift
//  APIproject
//
//  Created by Shraddha on 02/02/23.
//

import Foundation

class MovieModel{
    var adult: Int?
    var backdrop_path: String?
    var genre_ids: [Int]?
    var id: Int?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Double?
    var poster_path: String?
    var release_date: String?
    var title: String?
    var video: Int?
    var vote_average: Double?
    var vote_count: Int?
    
    init(data: [String: Any]) {
        if let adult = data["adult"] as? String {
            self.adult = Int(adult)
        }
        if let backdrop_path = data["backdrop_path"] as? String {
            self.backdrop_path = String(backdrop_path)
        }
        if let genre_ids = data["genre_ids"] as? [Int] {
            self.genre_ids = genre_ids
        }
        if let id = data["id"] as? Int {
            self.id = Int(id)
        }
        if let original_language = data["original_language"] as? String {
            self.original_language = String(original_language)
        }
        if let original_title = data["original_title"] as? String {
            self.original_title = String(original_title)
        }
        if let overview = data["overview"] as? String {
            self.overview = String(overview)
        }
        if let popularity = data["popularity"] as? Double {
            self.popularity = Double(popularity)
        }
        if let poster_path = data["poster_path"] as? String {
            self.poster_path = String(poster_path)
        }
        if let release_date = data["release_date"] as? String {
            self.release_date = String(release_date)
        }
        if let title = data["title"] as? String {
            self.title = String(title)
        }
        if let video = data["video"] as? Int {
            self.video = Int(video)
        }
        if let vote_average = data["vote_average"] as? Double {
            self.vote_average = Double(vote_average)
        }
        if let vote_count = data["vote_count"] as? Int {
            self.vote_count = Int(vote_count)
        }
    }
    
    
    
}
