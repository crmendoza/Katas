//: Playground - noun: a place where people can play

import Foundation

func findNumber(arr: [Int], k: Int) -> String {
    return arr.filter { $0 == k }.count > 0 ? "YES" : "NO"
}

func oddNumbers(l: Int, r: Int) -> [Int] {
    var numArray = [Int]()
    numArray += l...r
 
    return numArray.filter { $0 % 2 == 1}
}

oddNumbers(l: 2, r: 5)

func verifyItems(origItems: [String], origPrices: [Float], items: [String], prices: [Float]) -> Int {
 
    let mapping = zip(origItems, origPrices)
        .map {[$0: $1]}
        .flatMap { $0 }
        .reduce([String: Float]()) { (dict, tuple) in
            var varDict = dict
            varDict.updateValue(tuple.1, forKey: tuple.0)
            return varDict
        }
 
    var incorrectEntry = 0
    for index in 0..<items.count {
        if prices[index] != mapping[items[index]] {
            incorrectEntry += 1
        }
    }
    return incorrectEntry
}

verifyItems(origItems: ["rice", "sugar", "wheat", "cheese"], origPrices: [16.89, 56.92, 20.89, 345.99], items: ["rice", "cheese"], prices: [18.99, 400.89])

func rotLeft(a: [Int], d: Int) -> [Int] {
    if a.count == 1 {
        return a
    }

    let shiftOffset = d % a.count
    return Array(a[shiftOffset...a.count-1])+Array(a[0..<shiftOffset])
}

rotLeft(a: [3, 7, 2, 8, 9], d: 2)

func fibonacci(_ fib: Int) -> Int {
    if fib <= 2 {
        return 1
    } else {
        return fibonacci(fib-1) + fibonacci(fib-2)
    }
}

fibonacci(7)

class Node {
    var children: [Node]?
}


