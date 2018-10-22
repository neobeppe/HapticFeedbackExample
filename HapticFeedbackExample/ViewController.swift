//
//  ViewController.swift
//  HapticFeedbackExample
//
//  Created by Giuseppe Travasoni on 22/10/2018.
//  Copyright © 2018 Travasoni. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let hapticProvider = HapticProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Haptic Feedbacks"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let hapticStruct = hapticProvider.hapticStruct(at: section) else {
            return nil
        }
        return hapticStruct.sectionTitle
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let hapticStruct = hapticProvider.hapticStruct(at: section) else {
            return 0
        }
        return hapticStruct.numberOfCells
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        guard let hapticStruct = hapticProvider.hapticStruct(at: indexPath.section) else {
            return cell
        }
        cell.textLabel?.text = hapticStruct.title(for: indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let hapticStruct = hapticProvider.hapticStruct(at: indexPath.section) else {
            return
        }
        hapticStruct.action(for: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

