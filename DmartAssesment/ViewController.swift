//
//  ViewController.swift
//  DmartAssesment
//
//  Created by Manish Kumar on 26/03/20.
//  Copyright © 2020 Manish Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    var response : [ResponseData]?
    
    enum CellType {
        case carousel
        case list
        case grid
        case none
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainTableView.rowHeight = UITableView.automaticDimension
        mainTableView.estimatedRowHeight = 180
        mainTableView.tableFooterView = UIView()
        
        registerCells()
        loadJson(filename: "data")
    }
        
    func registerCells() {
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        mainTableView.register(UINib(nibName: "CarouselTableViewCell", bundle: nil), forCellReuseIdentifier: "CarouselTableViewCell")
        mainTableView.register(UINib(nibName: "ListViewTableViewCell", bundle: nil), forCellReuseIdentifier: "ListViewTableViewCell")
        mainTableView.register(UINib(nibName: "GridViewTableViewCell", bundle: nil), forCellReuseIdentifier: "GridViewTableViewCell")

    }
    
    func loadJson(filename fileName: String)  {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                //Using Codable/Decodable Protocol
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(Response.self, from: data)
                response = responseModel.data
            } catch {
                print("error:\(error)")
            }
        }
    }
    
    //To Get the Celltype that needs to be displayed
    func getCellType(type: String) -> CellType? {
        
        switch type {
        case "carousel":
            return .carousel
        case "list":
            return .list
        case "grid":
            return .grid
        default:
            return .none
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return response?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cellType = getCellType(type: response?[indexPath.row].type ?? "")  {
            
            switch cellType {
            case .carousel :
                let cell = tableView.dequeueReusableCell(withIdentifier: "CarouselTableViewCell", for: indexPath) as! CarouselTableViewCell
                cell.dataArray = response?[indexPath.row].bucket_data
                
                return cell
                
            case .list:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ListViewTableViewCell", for: indexPath) as! ListViewTableViewCell
                cell.dataArray = response?[indexPath.row].bucket_data
                cell.title = response?[indexPath.row].title

                return cell
            
            case .grid:
                let cell = tableView.dequeueReusableCell(withIdentifier: "GridViewTableViewCell", for: indexPath) as! GridViewTableViewCell
                cell.dataArray = response?[indexPath.row].bucket_data
                cell.title = response?[indexPath.row].title

                return cell
                
            case .none:
                let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")
                cell!.backgroundColor = .lightGray
                
                return cell!
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")
            cell!.backgroundColor = .lightGray
            
            return cell!
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

