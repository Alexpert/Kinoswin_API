import SQLite

class Database {
    static var instance: Database?
    var path: String

    init() {
        self.path = "Database/database.db"
    }

    class func getConnection() throws -> Connection {
        if instance == nil {
            instance = Database()
        } 
		return try Connection(instance!.path)
    }
}