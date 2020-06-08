
import Foundation

struct DataModel : Codable {
    var expression: String
    var operation: String
    var result: String
}

class DataHandeler {
    
    public private(set) var action: String // i.e derive, integrate or factor for example.
    public private(set) var equation: String // ex. 3x^2+3

    
    init(action: String, equation: String) {
        self.action = action
        self.equation = equation
    }
    
    public func FetchData(completion: @escaping (DataModel) -> Void) {
        
        let url = URL(string: "https://newton.now.sh/" + self.action + "/" + self.equation)!
    
        let session = URLSession.shared
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted])
                    
                    let jsonStr = String(data: jsonData, encoding: .utf8)
                    let data = jsonStr?.data(using: .utf8)
                    
                    let decoder = JSONDecoder()
                    do {
                        let user = try decoder.decode(DataModel.self, from: data!)
                        completion(user)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
}
