//
//  VideosModel.swift
//  youtub-onedaybuild
//
//  Created by عبدالعزيز رضا  on 6/28/20.
//  Copyright © 2020 abdelazizReda. All rights reserved.
//

import Foundation

struct video: Decodable {
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    
    // Make enum for each key
    
    enum codingKeys: String , CodingKey {

        case snippet
        case thumbnails
        case high
        case resourcsId
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
        
    }
    
    // make intializer
    init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: codingKeys.self)
        
        let snippetcontainer = try container.nestedContainer(keyedBy: codingKeys.self, forKey: .snippet)
        
        // parse title
        
        title.self = try snippetcontainer.decode(String.self
            , forKey: .title)
        
        // parse description
        
        description.self = try snippetcontainer.decode(String.self, forKey: .description)
        
        // parse publishe
        
        self.published = try snippetcontainer.decode(Date.self, forKey: .published)
        // parse thumbnail
        
        let thumbnailContainer = try snippetcontainer.nestedContainer(keyedBy: codingKeys.self, forKey: .thumbnails)
        let highcontainer = try thumbnailContainer.nestedContainer(keyedBy: codingKeys.self, forKey: .high)
        thumbnail.self = try highcontainer.decode(String.self, forKey: .thumbnail)
        
        // parse videoId
        let resourceIdContainer = try snippetcontainer.nestedContainer(keyedBy: codingKeys.self, forKey: .resourcsId)
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
        
        
    }
    
    
}
