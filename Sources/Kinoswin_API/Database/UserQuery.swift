import SQLite

class UserQuery {
    static let users = Table("users")
    static let id = Expression<Int64>("id")
    static let name = Expression<String>("name")
    static let ownerId = Expression<Int64>("ownerId")

    class func getAll() -> Table {
        return users
    }

    class func getFromId(id: Int64) -> Table {
        return users.filter(self.id == id)
    }

    class func getFromName(name: String) -> Table {
        return users.filter(self.name == name)
    }

    class func getFromOwnerId(id: Int64) -> Table {
        return users.filter(self.ownerId == ownerId)
    }

    class func insert(user: User) -> Insert {
        return users.insert(name <- user.name, ownerId <- user.ownerId)
    }

    class func delete(user: User) -> Delete {
        return getFromId(id: user.id).delete()
    }

    class func toUser(_ row: Row) -> User {
        return User(id: row[id], name: row[name], ownerId: row[ownerId])
    }
}