import Foundation

let config = try! Configuration.get()
print(config)

let app = Application()
app.run()

// let logger = SwiftLogger(path: "logger.log", domain: "main")
// logger.enableLogType(LogType.INFO)
// logger.log(LogType.INFO, "test", "riydfibudfib")
