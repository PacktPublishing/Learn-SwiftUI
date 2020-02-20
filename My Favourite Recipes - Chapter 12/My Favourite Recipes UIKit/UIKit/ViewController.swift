//
//  ViewController.swift
//  My Favourite Recipes UIKit
//
//  Created by Chris Barker on 07/02/2020.
//  Copyright © 2020 Packt. All rights reserved.
//

import UIKit

var mockData = [String]()

class DataSourceA: NSObject, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mockData[indexPath.row]
        return cell
    }
        
}

class ViewController: UIViewController, UITableViewDelegate {

    var tableView: UITableView!
    var dataSource: UITableViewDataSource!
    
    override func viewDidLoad() {

        // UITableView
        mockData = ["Recipe 1", "Recipe 2", "Recipe 3", "Recipe 4", "Recipe 5", "Recipe 6"]
        dataSource = DataSourceA()
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 400))
        tableView.delegate = self
        tableView.dataSource = dataSource
        tableView.tableFooterView = UIView()
        
        view.addSubview(tableView)
        
        // Button with corner radius
        
        let button = UIButton(frame: CGRect(x: 0, y: 400, width: view.bounds.width - 60, height: 55))
        button.center = CGPoint(x: view.center.x, y: button.center.y)
        
        button.setTitle("Border & Radius", for: .normal)
        
        button.backgroundColor = .blue
        button.layer.cornerRadius = 15
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 8
        button.layer.masksToBounds = true
        
        view.addSubview(button)
         
        
        // View with a Gradient
        
        let gradientView = UIView(frame: CGRect(x: 0, y: 490, width: view.bounds.width - 150, height: 150))
        gradientView.center = CGPoint(x: view.center.x, y: gradientView.center.y)
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.frame.size = gradientView.frame.size
        gradientLayer.colors = [UIColor.white.cgColor,
                                UIColor.blue.cgColor,
                                UIColor.green.cgColor]
        gradientView.layer.addSublayer(gradientLayer)
        
        view.addSubview(gradientView)
        
        // UILabel with Strikethough
        
        let label = UILabel(frame:  CGRect(x: 0, y: 640, width: view.bounds.width - 150, height: 150))
        label.textAlignment = .center
        label.center = CGPoint(x: view.center.x, y: label.center.y)
        
        let attributedString = NSMutableAttributedString(string: "Strike through me")
        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 7, length: 7))
        label.attributedText = attributedString
        
        view.addSubview(label)
        
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        present(SecondViewController(), animated: true, completion: nil)
    }
    
}

class SecondViewController: UIViewController {

}


