import Foundation
import SwiftLogger

struct LoggerConfiguration: Codable {
    var types: [String]

    private enum CodingKeys: String, CodingKey {
        case types = "types"
    }
}

struct ApplicationConfiguration: Codable {
    var port: Int

    private enum CodingKeys: String, CodingKey {
        case port = "port"
    }
}

struct DatabaseConfiguration: Codable {
    var path: String
    var create: String

    private enum CodingKeys: String, CodingKey {
        case path = "path"
        case create = "create"
    }
}

struct DataConfiguration: Codable {
    var owner: String

    private enum CodingKeys: String, CodingKey {
        case owner = "owner"
    }
}

struct Configuration: Codable {
    var logger: LoggerConfiguration
    var application: ApplicationConfiguration
    var database: DatabaseConfiguration
    var data: DataConfiguration

    private enum CodingKeys: String, CodingKey {
        case logger = "Logger"
        case application = "Application"
        case database = "Database"
        case data = "Data"
    }
}

class ConfigurationParser {
    let configPath = "Config/config.json"
    static var configuration: Configuration? = nil

    static private func getConfiguration() throws -> Configuration {
        let content = try String(contentsOf: URL(fileURLWithPath: "Config/config.json"), encoding: .utf8)
        var configuration: Configuration? = nil
        do {
            configuration = try JSONDecoder().decode(Configuration.self, from: content.data(using: .utf8)!)
            
            let logger = SwiftLogger(path: "Logs/startup.log", domain: "configuration")
            logger.enableLogType(type: LogType.INFO)
            logger.log(type: LogType.INFO, header: "getConfiguration", content: content)

        } catch let error as NSError {
            
            let logger = SwiftLogger(path: "Logs/startup.log", domain: "configuration")
            logger.enableLogType(type: LogType.INFO)
            logger.log(type: LogType.INFO, header: "getConfiguration", content: "Error: \(error.description)")
        }

        return configuration!
    }

    static func get() -> Configuration {
        if (self.configuration == nil) {
            self.configuration = try? getConfiguration()
        }
        return self.configuration!
    }
}