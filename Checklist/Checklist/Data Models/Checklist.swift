//
//  Checklist.swift
//  Checklist
//
//  Created by Eoghan on 2018-06-01.
//  Copyright © 2018 Vestego. All rights reserved.
//

import UIKit

class Checklist: NSObject, Codable {
    var name = ""
    var items = [ChecklistItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
    
    func countUnckeckedItems() -> Int {
        var count = 0
        for item in items where !item.checked {
            count += 1
        }
        return count
    }
}
