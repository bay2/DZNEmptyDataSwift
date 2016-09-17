//
//  MasterViewController.swift
//  Examples
//
//  Created by xuemincai on 16/7/12.
//  Copyright © 2016年 xuemincai. All rights reserved.
//

import UIKit


class MasterViewController: UITableViewController, EmptyDataSource, EmptyDelegate, UISearchResultsUpdating, UISearchBarDelegate {

    var detailViewController: DetailViewController? = nil
    var objects = [AnyObject]()
    var searchController: UISearchController = UISearchController(searchResultsController: nil)
    var applications: [Application] = []
    
    var filteredApps: Array<Application> {
        
        get {
            
            let searchBar = self.searchController.searchBar
            
            if searchBar.isFirstResponder && searchBar.text?.lengthOfBytes(using: .unicode) ?? 0 > 0 {
                
                return self.applications.filter { (value) -> Bool in
                    value.displayName.contains(searchBar.text ?? "")
                    
                }
            }
            
            return self.applications
            
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.serializeApplications()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.tableFooterView = UIView()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        configSearchController()

    }
    
    func configSearchController() {
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search here..."
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        searchController.dimsBackgroundDuringPresentation = false
        self.tableView.tableHeaderView = searchController.searchBar
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.titleTextAttributes = nil
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        
        UIApplication.shared.setStatusBarStyle(.default, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - 序列化
    
    func serializeApplications() {
        
        guard let path = Bundle.main.path(forResource: "applications", ofType: "json") else {
            return
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            return
        }
        
        guard let objects = (try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)) as? [AnyObject] else {
            return
        }
                
        
        self.applications = objects.map { (value) -> Application? in
            
            guard let appDict = value as? [String: AnyObject] else {
                return nil
            }
            
            return Application(dict: appDict)
            
            }.flatMap { $0 }
        
        
    }
    


    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.filteredApps.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var app = self.filteredApps[indexPath.row]
        
        cell.textLabel?.text = app.displayName
        cell.detailTextLabel?.text = app.developerName
                
        let image = UIImage(named: app.iconName)
        cell.imageView?.image = image
        
        cell.imageView?.layer.cornerRadius = (image?.size.width ?? 0)*0.2
        cell.imageView?.layer.masksToBounds = true
        cell.imageView?.layer.borderColor = UIColor(white: 0, alpha: 0.2).cgColor
        cell.imageView?.layer.borderWidth = 0.5
        cell.imageView?.layer.shouldRasterize = true
        cell.imageView?.layer.rasterizationScale = UIScreen.main.scale
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        let vc = DetailViewController(application: self.applications[indexPath.row])
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

    // MARK: - UISearchResultsUpdating
    
    func updateSearchResults(for searchController: UISearchController) {
        
        tableView.reloadData()
    }
    
    
    
    
}

