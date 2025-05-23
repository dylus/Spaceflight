import Foundation

final class MockURLProtocol: URLProtocol {
    static var capturedRequest: URLRequest?

    override class func canInit(with task: URLSessionTask) -> Bool {
        capturedRequest = task.originalRequest
        return true
    }

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        client?.urlProtocol(self, didLoad: loadJSONData())
        client?.urlProtocol(self, didReceive: HTTPURLResponse(), cacheStoragePolicy: .allowed)
        client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {}
    
    private func bundle() -> Bundle {
        return Bundle(for: type(of: self))
    }
    
    func loadJSONData() -> Data {
        let url = bundle().url(forResource: "Articles", withExtension: "json")!
        do {
            return try Data(contentsOf: url)
        } catch {
            return Data()
        }
    }
}

