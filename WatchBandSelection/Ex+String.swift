//
//  Ex+String.swift
//  WatchBandSelection
//
//  Created by O'ral Nabiyev on 07/03/24.
//

import UIKit
import CommonCrypto

extension String {
    
    //MARK: - number formatter
    //formatter numbers. Ex: 12 000 000
    func numberFormatter() -> String {
        
        let myNum: String = self
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " " // Устанавливаем пробел в качестве разделителя разрядов
        
        if let formattedNumber = formatter.string(from: NSNumber(value: Double(myNum) ?? 0)) {
            return formattedNumber
        } else {
            return "\(Double(myNum) ?? 0)"
        }
    }
    
}

