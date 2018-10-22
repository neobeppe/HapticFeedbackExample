//
//  HapticProvider.swift
//  HapticFeedbackExample
//
//  Created by Giuseppe Travasoni on 22/10/2018.
//  Copyright © 2018 Travasoni. All rights reserved.
//

import Foundation

struct HapticProvider {
    
    private let hapticStructs: [HapticStruct]
    
    init() {
        hapticStructs = [UIImpactFeedbackGeneratorStruct(),
                         UINotificationFeedbackGeneratorStruct(),
                         UISelectionFeedbackGeneratorStruct()]
    }
    
    func hapticStruct(at index: Int) -> HapticStruct? {
        guard hapticStructs.indices.contains(index) else {
            return nil
        }
        return hapticStructs[index]
    }
    
    var numberOfStructs: Int {
        return hapticStructs.count
    }
}
