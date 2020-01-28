import Foundation
import SwiftLogger

let config = ConfigurationParser.get()

let logger = SwiftLogger(path: "Logs/startup.log", domain: "main")
logger.enableLogType(type: LogType.INFO)
logger.log(type: LogType.INFO, header: "startup", content: "starting at port: \(config.application.port)")

let app = Application()
app.run()
