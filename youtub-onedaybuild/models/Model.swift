//
//  Model.swift
//  youtub-onedaybuild
//
//  Created by عبدالعزيز رضا  on 6/28/20.
//  Copyright © 2020 abdelazizReda. All rights reserved.
//

import Foundation

protocol modelDeleget{
    func videosFetched(_ videos:[video])
}


class Model{
    var deleget:modelDeleget?
   
    func getVideo(){
        // URl object
        let url = URL(string: Constants.API_URL)
        guard url != nil else{
                  return
              }
        // get URL session
        let session = URLSession.shared
        
        //  DataTask from URL
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error != nil || data != nil {
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)
                
                
                // make it for through the data from deleget
                if response.items != nil {
                    self.deleget?.videosFetched(response.items!)
                }
                
                //dump(response)
                
            }catch{
                
                
            } 
        }
        // kik of the task
        dataTask.resume()
        
        
    }
    
}
