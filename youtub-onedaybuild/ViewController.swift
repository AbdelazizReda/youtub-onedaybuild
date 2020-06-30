//
//  ViewController.swift
//  youtub-onedaybuild
//
//  Created by عبدالعزيز رضا  on 6/27/20.
//  Copyright © 2020 abdelazizReda. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate, modelDeleget{

    
 
    @IBOutlet weak var tableView: UITableView!
    var model = Model()
    var videos = [video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.getVideo()
        tableView.dataSource = self
        tableView.delegate = self
        model.deleget = self
        
        
        
    }
    
    
    

    //MARK:- model deleget methodes
    
    func videosFetched(_ videos: [video]) {
        //set return videos
        self.videos = videos
        // referesh the tableView
        tableView.reloadData()
    }
    
    
    //MARK:- Tableview methods
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellId, for: indexPath)
        
        // configuer the cell with the data
        
        let title = self.videos[indexPath.row].title
        cell.textLabel?.text = title
        
        // return cell
        return cell 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

