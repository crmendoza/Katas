//: Playground - noun: a place where people can play

import UIKit

func decodeResistorColors(_ bands: String) -> String {
    let resistorValues:[String: Double] = ["black" : 0, "brown": 1, "red": 2, "orange": 3, "yellow": 4, "green": 5, "blue": 6, "violet": 7, "gray": 8, "white": 9, "gold": 5, "silver":10]
    var tolerance = 20
    var ohms = 0.0
    
    for (index, band) in bands.components(separatedBy: " ").enumerated() {
        switch index {
        case 0:
            ohms += resistorValues[String(band)]! * 10
        case 1:
            ohms += resistorValues[band]!
        case 2:
            ohms = ohms * Double(pow(Double(10), resistorValues[band]!))
        default:
            tolerance = Int(resistorValues[band]!)
            break;
        }
    }
    
    let formatter = NumberFormatter.init()
    formatter.usesSignificantDigits = true
    formatter.minimumFractionDigits = 1
    switch ohms {
    case 0..<1000:
        return "\(formatter.string(from: NSNumber(value: ohms))!) ohms, \(tolerance)%"
    case 1000..<1000000:
        return "\(formatter.string(from: NSNumber(value: ohms/1000.0))!)k ohms, \(tolerance)%"
    default:
        return "\(formatter.string(from: NSNumber(value: ohms/1000000.0))!)M ohms, \(tolerance)%"
    }
}

let tests = ["yellow violet black",
             "yellow violet red gold",
             "brown black green silver",
             "brown black black",
             "brown black brown gold",
             "red red brown",
             "orange orange brown gold",
             "yellow violet brown silver",
             "blue gray brown",
             "brown black red silver",
             "brown black orange",
             "red red orange silver",
             "yellow violet orange gold",
             "brown black yellow gold",
             "orange orange yellow gold",
             "red black green gold", "white gray green gold"]
for text in tests {
    print(decodeResistorColors(text))
}
