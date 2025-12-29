//
//  ImageSize.swift
//  tmdb
//
//  Created by Vishank Raghav on 28/11/23.
//

import Foundation

struct ImageSize {
    
    static var posterSize: String = ""
    static var backdropSize: String = ""
    static var profileSize: String = ""
    static var logoSize: String = ""
    
    init(posterSize: ImageSize.Poster,
         backdropSize: ImageSize.Backdrop,
         profileSize: ImageSize.profile,
         logoSize: ImageSize.Logo) {
        ImageSize.posterSize = posterSize.rawValue
        ImageSize.backdropSize = backdropSize.rawValue
        ImageSize.profileSize = profileSize.rawValue
        ImageSize.logoSize = logoSize.rawValue
    }
    
    enum Poster: String {
        case w92
        case w154
        case w185
        case w342
        case w500
        case w780
        case original
    }
    
    enum Backdrop: String {
        case w300
        case w780
        case w1280
        case original
    }
    
    enum profile: String {
        case w45
        case w185
        case h632
        case original
    }
    
    enum Logo: String {
        case w45
        case w92
        case w154
        case w185
        case w300
        case w500
        case original
    }
}

/*
 "images": {
 "base_url": "http://image.tmdb.org/t/p/",
 "secure_base_url": "https://image.tmdb.org/t/p/",
 "backdrop_sizes": [
 "w300",
 "w780",
 "w1280",
 "original"
 ],
 "logo_sizes": [
 "w45",
 "w92",
 "w154",
 "w185",
 "w300",
 "w500",
 "original"
 ],
 "poster_sizes": [
 "w92",
 "w154",
 "w185",
 "w342",
 "w500",
 "w780",
 "original"
 ],
 "profile_sizes": [
 "w45",
 "w185",
 "h632",
 "original"
 ],
 "still_sizes": [
 "w92",
 "w185",
 "w300",
 "original"
 ]
 },
 "change_keys": [
 "adult",
 "air_date",
 "also_known_as",
 "alternative_titles",
 "biography",
 "birthday",
 "budget",
 "cast",
 "certifications",
 "character_names",
 "created_by",
 "crew",
 "deathday",
 "episode",
 "episode_number",
 "episode_run_time",
 "freebase_id",
 "freebase_mid",
 "general",
 "genres",
 "guest_stars",
 "homepage",
 "images",
 "imdb_id",
 "languages",
 "name",
 "network",
 "origin_country",
 "original_name",
 "original_title",
 "overview",
 "parts",
 "place_of_birth",
 "plot_keywords",
 "production_code",
 "production_companies",
 "production_countries",
 "releases",
 "revenue",
 "runtime",
 "season",
 "season_number",
 "season_regular",
 "spoken_languages",
 "status",
 "tagline",
 "title",
 "translations",
 "tvdb_id",
 "tvrage_id",
 "type",
 "video",
 "videos"
 ]
 }
 */
