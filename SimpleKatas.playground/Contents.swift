//: Playground - noun: a place where people can play

import UIKit

// Don't Give Me Fives!
func dontGiveMeFive(_ start: Int, _ end: Int) -> Int {
    return (start ... end).filter { !String($0).contains("5") }.count
}

for (start, end) in [(4, 17), (0, 6), (13, 55), (1, 9)] {
    print("\(dontGiveMeFive(start, end))")
}

// Jaden Casing
func jadenCasing(_ sentence: String) -> String {
    return sentence.split(separator: " ").map { $0.capitalized }.joined(separator: " ")
}

//Counting in the Amazon
func countArara(_ num: Int) -> String {
    return ( Array(repeating: "adak", count: num/2) + Array(repeating: "anane", count: num%2) ).joined(separator: " ")
}

// Sum of Multiples of 3 or 5

func findSum(_ n: Int) -> Int {
    var numArray = [Int]()
    numArray += 1...n
    
    return numArray.filter { $0 % 3 == 0 || $0 % 5 == 0 }.reduce ( 0, { $0 + $1 } )
}

for num in [5, 10, 28, 39, 41, 50, 62, 73, 84, 91, 104] {
    print("The sum of multiples of 3 or 5 from 1 to \(num) is \(findSum(num))")
}
