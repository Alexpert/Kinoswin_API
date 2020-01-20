import SQLite

class LoggableQuery {
    static let loggables = Table("loggables")
    static let id = Expression<Int64>("id")
    static let password = Expression<String>("password")

    class func getAll() -> Table {
        return loggables
    }

    class func getFromId(id: Int64) -> Table {
        return loggables.filter(self.id == id)
    }

    class func insert(user: Loggable) -> Insert {
        return loggables.insert(id <- user.id, password <- user.password)
    }

    class func delete(user: Loggable) -> Delete {
        return getFromId(id: user.id).delete()
    }

    class func update(user: Loggable) -> Update {
        return getFromId(id: user.id).update(password <- user.password)
    }

    class func toLoggable(_ row: Row) -> Loggable {
        print(row)
        let user = try! User.getFromId(id: row[id])[0]
        return Loggable(id: row[id], name: user.name, ownerId: user.ownerId, password: row[password])
    }
}