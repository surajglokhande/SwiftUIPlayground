//: [Previous](@previous)
/*:
 **async let:** Use async let to initiate multiple asynchronous operations concurrently and then await their results. This is ideal when you have independent tasks that need to run in parallel and you need to wait for all of them to complete before proceeding.
 */
import Foundation

func fetchDataConcurrently() async {
    async let data1 = fetchData(from: "url1")
    async let data2 = fetchData(from: "url2")
    
    let result1 = await data1
    let result2 = await data2
    
    print("\(result1), \(result2)")
    // Process result1 and result2
}

func fetchData(from url: String) async -> Data {
    // Perform network request and return Data
    return Data()
}

await fetchDataConcurrently()

//: [Next](@next)
