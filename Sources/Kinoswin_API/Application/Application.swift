import Kitura
import SwiftLogger

class Application {
    let router = Router()

    init() {
        let logger = SwiftLogger(path: "Logs/startup.log", domain: "application")
        logger.enableLogType(type: LogType.INFO)
        logger.log(type: LogType.INFO, header: "init", content: "initializing")

        initFileRoutes(app: self)
        initINodeRoutes(app: self)
        initLoggableRoutes(app: self)
        initMemberRoutes(app: self)
        initReaderRoutes(app: self)
        initUserRoutes(app: self)
        initWriterRoutes(app: self)
    }

    func run() {
        
        let logger = SwiftLogger(path: "Logs/startup.log", domain: "main")
        logger.enableLogType(type: LogType.INFO)
        logger.log(type: LogType.INFO, header: "run", content: "running at \(ConfigurationParser.get().application.port)")

        Kitura.addHTTPServer(onPort: ConfigurationParser.get().application.port, with: router)
        Kitura.run()
    }
}