//
//  ViewController.swift
//  CDCollector
//
//  Created by Christopher Cennon on 2017-02-24.
//  Copyright © 2017 Christopher Cennon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var discs : [CD] = []
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
        discs = try context.fetch(CD.fetchRequest())
            tableView.reloadData()
        } catch {
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return discs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let disc = discs[indexPath.row]
        cell.textLabel?.text = disc.title
        cell.imageView?.image = UIImage(data: disc.image as! Data)
        
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

