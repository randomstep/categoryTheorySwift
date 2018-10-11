// Chapter 2

// To make properly generic, nest in a type
// Need a type to hold onto the memoized values for later lookup
class Mem<Input, Output> where Input: Hashable {
  private var memoizedCalls: [Input: Output] = [:]

  private let containedFunc: (Input) -> Output

  init(containedFunc: @escaping (Input) -> Output) {
    self.containedFunc = containedFunc
  }

  /// Make pure functions more performant for multiple calls by caching
  /// specific inputs instead of performing all the work again.
  func exec(_ input: Input) -> Output {
    if let output = memoizedCalls[input] { return output }

    let res = containedFunc(input)
    memoizedCalls[input] = res
    return res
  }
}

// Test out memoization

func double(x: Int) -> Int {
  return x * 2
}

/*
 // Move to ... something. Func called by main? Or a perf test would be better.
let memoDouble = Mem(containedFunc: double)

import Foundation

print(Date())

let four = memoDouble.exec(2)
print(four)

print(Date())

let ten = memoDouble.exec(5)
print(ten)

print(Date())

// Really would want to performance test, this repeat call should be much quicker
print(memoDouble.exec(2))

print(Date())
*/
