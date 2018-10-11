import Foundation

// Chapter 1: Identity Function
func i<T>(_ x: T) -> T {
  return x
}

//print(i("Any Type should work here"))

func compose<T,U,V>(_ a: @escaping (T) -> U, _ b: @escaping (U) -> V) -> (T) -> V {
  return { (arg: T) -> V in
    return b(a(arg))
  }
//  return b(a)
}

//  Can I get infix operator working?
//infix operator => <T,U,V> (_ a: (T) -> U, _ b: (U) -> V) -> (T) -> V {
//
//}

func addOne(_ x: Int) -> Int {
  return x + 1
}
print("addOne works: \(addOne(2))")
func toString(_ x: Int) -> String {
  return String(x)
}
print("toString works: \(type(of: toString(3)))")

let composed = compose(addOne, toString)

print("Does it work? Should be string of 2: \(composed(1)), \(type(of: composed(1)))")
