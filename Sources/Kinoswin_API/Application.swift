import Kitura
import KituraOpenAPI

class Application {
    let router = Router()

    init() {

        initFileRoutes(app: self)
        initINodeRoutes(app: self)
        initLoggableRoutes(app: self)
        initMemberRoutes(app: self)
        initReaderRoutes(app: self)
        initUserRoutes(app: self)
        initWriterRoutes(app: self)
    }

    func run() {
        Kitura.addHTTPServer(onPort: 8080, with: router)
        Kitura.run()
    }
}