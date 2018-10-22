//
//  Structs.swift
//  HapticFeedbackExample
//
//  Created by Giuseppe Travasoni on 22/10/2018.
//  Copyright © 2018 Travasoni. All rights reserved.
//

import UIKit

protocol HapticStruct {
    
    var sectionTitle: String { get }
    var numberOfCells: Int { get }
    var cellTitles: [String] { get }
    func title(for index: Int) -> String?
    func action(for index: Int)
}

extension HapticStruct {
    
    func title(for index: Int) -> String? {
        
        guard cellTitles.indices.contains(index) else {
            return nil
        }
        return cellTitles[index]
    }
}

struct UIImpactFeedbackGeneratorStruct: HapticStruct {
    
    var sectionTitle: String {
        return "UIImpactFeedbackGenerator"
    }
    
    var numberOfCells: Int {
        return 3
    }
    
    var cellTitles: [String] {
        return ["Syle Light", "Style Medium", "Style Heavy"]
    }
    
    func action(for index: Int) {
        switch index {
        case 0:
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        case 1:
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        case 2:
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        default:
            return
        }
    }
}

struct UINotificationFeedbackGeneratorStruct: HapticStruct {
    
    var sectionTitle: String {
        return "UINotificationFeedbackGenerator"
    }
    
    var numberOfCells: Int {
        return 3
    }
    
    var cellTitles: [String] {
        return ["Notification type Error", "Notification type Success", "Notification type Warning"]
    }
    
    func action(for index: Int) {
        switch index {
        case 0:
            UINotificationFeedbackGenerator().notificationOccurred(.error)
        case 1:
            UINotificationFeedbackGenerator().notificationOccurred(.success)
        case 2:
            UINotificationFeedbackGenerator().notificationOccurred(.warning)
        default:
            return
        }
    }
}

struct UISelectionFeedbackGeneratorStruct: HapticStruct {
    
    var sectionTitle: String {
        return "UISelectionFeedbackGenerator"
    }
    
    var numberOfCells: Int {
        return 1
    }
    
    var cellTitles: [String] {
        return ["Selection Changed"]
    }
    
    func action(for index: Int) {
        UISelectionFeedbackGenerator.init().selectionChanged()
    }
    
    
}
