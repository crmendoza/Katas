//: Playground - noun: a place where people can play

import UIKit

// The classical introductory exercise. Just say "Hello, World!".
func hello(_ person: String = "World") -> String {
    return "Hello, \(person)!"
}

// Two-fer or 2-fer is short for two for one. One for you and one for me.
func twoFer(name: String = "you") -> String {
    return "One for \(name), one for me"
}

// Given a year, report if it is a leap year.
struct Year {
    let calendarYear: Int
    
    func isLeapYear() -> Bool {
        if calendarYear%4 != 0 || (calendarYear%100 == 0 && calendarYear%400 != 0) {
            return false
        }
        return true
    }
}

func testLeapYear() {
    print(Year(calendarYear: 1996).isLeapYear())
    print(Year(calendarYear: 1997).isLeapYear())
    print(Year(calendarYear: 1900).isLeapYear())
    print(Year(calendarYear: 2018).isLeapYear())
    print(Year(calendarYear: 2400).isLeapYear())
}

// Given a word, compute its scrabble score
class Scrabble {
    static func test() {
        print(Scrabble.scrabbleScore("cabbage"))
        print(Scrabble.scrabbleScore(""))
        print(Scrabble.scrabbleScore(" \t\n"))
        print(Scrabble.scrabbleScore(nil))
        print(Scrabble.scrabbleScore("a"))
        print(Scrabble.scrabbleScore("f"))
        print(Scrabble.scrabbleScore("street"))
        print(Scrabble.scrabbleScore("quirky"))
        print(Scrabble.scrabbleScore("OXYPHENBUTAZONE"))
        print(Scrabble.scrabbleScore("alacrity"))
    }
    
    static func scrabbleScore(_ word: String?) -> Int {
        guard let word = word else { return 0 }
        return word.uppercased().map { value($0) }.reduce(0, { $0 + $1 })
    }
    
    private static func value(_ letter: Character) -> Int {
        switch letter {
        case "A", "E", "I", "O", "U", "L", "N", "R", "S", "T":
            return 1
        case "D", "G":
            return 2
        case "B", "C", "M", "P":
            return 3
        case "F", "H", "V", "W", "Y":
            return 4
        case "K":
            return 5
        case "J", "X":
            return 8
        case "Q", "Z":
            return 10
        default:
            return 0
        }
    }
}

enum TriangleType {
    case equilateral
    case scalene
    case isosceles
    case degenerate
    case invalid
}

func triangleType(_ a: Int, _ b: Int, _ c: Int) -> TriangleType {
    if a > 0, b > 0, c > 0 {
        
        if a+b == c {
            return .degenerate
        }
        
        if a == b, b == c {
            return .equilateral
        }
        
        if a == b || a == c || b == c {
            return .isosceles
        }
    }
    
    return .invalid
}
