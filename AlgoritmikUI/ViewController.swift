//
//  ViewController.swift
//  AlgoritmikUI
//
//  Created by Barış Aydemir on 20.10.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let tableView = UITableView()
    var data = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        view.addSubview(tableView)
        
        // Örnek veriyi oluşturmak için bir algoritma
        for _ in 0..<20 {
            let randomText = generateRandomText()
            data.append(randomText)
        }
    }
    
    func generateRandomText() -> String {
        let letters = "abcdefghijklmnopqrstuvwxyz"
        return String((0..<10).map { _ in letters.randomElement()! })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Tüm hücreleri seç ve arka plan rengini değiştir
        for cell in tableView.visibleCells {
            cell.backgroundColor = randomColor()
        }
    }
    
    func randomColor() -> UIColor {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
