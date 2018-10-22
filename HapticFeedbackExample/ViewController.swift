//
//  ViewController.swift
//  HapticFeedbackExample
//
//  Created by Giuseppe Travasoni on 22/10/2018.
//  Copyright © 2018 Travasoni. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let hapticStructs: [HapticStruct] = [UIImpactFeedbackGeneratorStruct(), UINotificationFeedbackGeneratorStruct(), UISelectionFeedbackGeneratorStruct()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Haptic Feedbacks"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard hapticStructs.indices.contains(section) else {
            return nil
        }
        return hapticStructs[section].sectionTitle
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard hapticStructs.indices.contains(section) else {
            return 0
        }
        return hapticStructs[section].numberOfCells
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        guard hapticStructs.indices.contains(indexPath.section),
            hapticStructs[indexPath.section].cellTitles.indices.contains(indexPath.row) else {
            return cell
        }
        cell.textLabel?.text = hapticStructs[indexPath.section].cellTitles[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard hapticStructs.indices.contains(indexPath.section) else {
            return
        }
        hapticStructs[indexPath.section].action(for: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

