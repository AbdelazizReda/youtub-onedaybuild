//
//  Response.swift
//  youtub-onedaybuild
//
//  Created by عبدالعزيز رضا  on 6/29/20.
//  Copyright © 2020 abdelazizReda. All rights reserved.
//

import Foundation

struct Response: Decodable{
    var items:[video]?
    
    enum CodingKeys: String , CodingKey {
        case items
    }
    
    
    init (from decode: Decoder) throws{
        let container = try decode.container(keyedBy: CodingKeys.self)
        self.items = try container.decodeIfPresent([video].self, forKey: .items)
        
    }
    
}
