import Foundation

class Configuration {
    let configPath = "Config/config.json"

    static func get() throws -> Any {
        let content = try String(contentsOf: URL(fileURLWithPath: "Config/config.json"), encoding: .utf8)
        return try JSONSerialization.jsonObject(with: content.data(using: .utf8)!)
    }
}