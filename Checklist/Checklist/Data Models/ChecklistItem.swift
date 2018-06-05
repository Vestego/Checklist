//
//  ChecklistItem.swift
//  Checklist
//
//  Created by Eoghan on 2018-05-21.
//  Copyright © 2018 Vestego. All rights reserved.
//

import Foundation
class ChecklistItem: NSObject, Codable {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
